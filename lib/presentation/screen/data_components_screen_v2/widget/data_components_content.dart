import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_bricks/app/util/extenstion/swagger_type_extension.dart';
import 'package:onix_flutter_bricks/app/widget/common/misk.dart';
import 'package:onix_flutter_bricks/core/di/app.dart';
import 'package:onix_flutter_bricks/domain/entity/component/components.dart';
import 'package:onix_flutter_bricks/domain/entity/component/data_object_component.dart';
import 'package:onix_flutter_bricks/domain/entity/component/source_component.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_dialog.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/objects/object_item.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/section_header.dart';
import 'package:onix_flutter_bricks/presentation/screen/data_components_screen_v2/widget/sources/source_item_section.dart';

class DataComponentsContent extends StatefulWidget {
  final Components components;

  const DataComponentsContent({
    required this.components,
    super.key,
  });

  @override
  State<DataComponentsContent> createState() => _DataComponentsContentState();
}

class _DataComponentsContentState extends State<DataComponentsContent> {
  final StreamController<Offset> _hoverController = StreamController<Offset>();
  late final Stream<Offset> _hoverStream;

  DataObjectComponent? _hoveredObject;

  @override
  void initState() {
    super.initState();
    _hoverStream = _hoverController.stream.distinct();
  }

  @override
  Widget build(BuildContext context) {
    final components = widget.components;
    return MouseRegion(
      onHover: (event) {
        _hoverController.add(event.position - const Offset(100, 0));
      },
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: Delimiter.height(100)),
              const SliverToBoxAdapter(child: SectionHeader(title: 'Sources')),
              SliverList.builder(
                itemCount: components.sources.length,
                itemBuilder: (context, index) {
                  return SourceItem(
                    source: components.sources[index],
                    objects: _getSourceObjects(components.sources[index]),
                    onHover: (object) {
                      if (_hoveredObject != object) {
                        _hoveredObject = object;
                      }
                    },
                  );
                },
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              const SliverToBoxAdapter(child: SectionHeader(title: 'Objects')),
              SliverList.builder(
                itemCount: components.dataObjects.length,
                itemBuilder: (context, index) {
                  return ObjectItem(object: components.dataObjects[index]);
                },
              ),
            ],
          ),
          StreamBuilder<Offset>(
            stream: _hoverStream,
            builder: (context, snapshot) {
              if (_hoveredObject == null || snapshot.data == null) {
                return const SizedBox();
              }
              return Positioned(
                left: snapshot.data?.dx,
                top: snapshot.data?.dy,
                child: ObjectDialog(
                  object: _hoveredObject!,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  List<DataObjectComponent> _getSourceObjects(SourceComponent source) {
    final sourceComponents = <String>{}
      ..addAll(
        source.requests
            .where((element) => element.requestBody != null)
            .map((e) => e.requestBody!.type.toString())
            .toList(),
      )
      ..addAll(
        source.requests
            .where((element) => element.response.type.from.isNotEmpty)
            .map((e) => e.response.type.toString()),
      );

    final sourceComponentObjects = widget.components.dataObjects
        .where((element) => sourceComponents.contains(element.name))
        .toList(growable: true);

    final result = <DataObjectComponent>[...sourceComponentObjects];

    for (final component in sourceComponentObjects) {
      if (component.variables.isNotEmpty) {
        for (final variable in component.variables) {
          final ref = variable.type.getSwaggerObjectReference();

          if (ref != null) {
            final object = widget.components.dataObjects
                .firstWhereOrNull((element) => element.name == ref.reference);
            if (object != null) {
              result.add(object);
            }
          }
        }
      }
    }

    logger.f(
        'Source ${source.name} objects: ${result.map((e) => e.name).toList()}');

    return result;
  }

  @override
  void dispose() {
    _hoverController.close();
    super.dispose();
  }
}
