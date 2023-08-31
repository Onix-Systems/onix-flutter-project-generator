// ignore_for_file: leading_newlines_in_multiline_strings

const getAccessTokenMutation =
    r'''mutation customerAccessTokenCreate($input: CustomerAccessTokenCreateInput!) {
      customerAccessTokenCreate(input: $input) {
      customerAccessToken {
      accessToken
      expiresAt 
      }
        customerUserErrors {
          message
          code
          field
         }
      }
    }
    ''';
