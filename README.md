# s3mail
A simple AWS system for processing emails, useful for development, etc.

## Layout

The layout of this project is mostly based around having small, prod-only modules installed in the Lambda layer and in the final product while keeping the SAM/CF template as simple and unmodified as possible.

- _root_: SAM/CF template, unit tests, etc.  Makes the shared code available to the lambdas in a local context.
    - **lambda**: The code of the lambdas comprising this project.
        - **converter**: Converts emails (.eml files) into a few different formats for ease of use
        - **inbound**: Processes "incoming" emails placed in an S3 bucket and updates the S3 key to simulate sorting into a folder structure
        - **outbound**: Intercepts "outgoing" emails and updates the S3 key to simulate sorting into a folder structure
    - **layer**: Lambda base layers.
        - **nodejs**: The foundation of the Node lambda layer packaged with the three lambdas that form this project.
    - **local_modules**: Local-only Node modules.
        - **shared**: Shared code for this project.
        - **test**: Shared testing code.
    - **tests**: Automated tests.
        - **unit**: Unit tests.
        - **functional**: Functional tests.
