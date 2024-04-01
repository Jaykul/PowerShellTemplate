# Classes

Contains classes, enums, and other prerequisites for the module (e.g. #using statements, constant variables, initialization code).

We use filenames with a two digit prefix, such that we can control the order they are added to the PSM1 by Optimize-Module.
This allows control of prerequisites, as in the case of ModuleFileClass which requires ModuleFileType to have been defined.

## Examples

- `#using` statements to load enums etc from another module
- param() block defining settable module variables
- Constants for use within the module
- Enums used for validation / tab-completion in function parameters
- Classes used for DSC resources
