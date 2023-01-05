<h1> FLUTTER SIMPLE TEST CRUDE APPLICATION</h1>

# General description
this is a simple application for test

# Technical description
* architecture => clean architect.
* state management => bloc
* storage => floor
* validation => formZ
* dependency injection => getIt

# Project structure
<pre>

├───assets    => contains assets like font and maybe image and etc 
│   └───fonts
├───lib
│   ├───config => holds route configuration and them config
│   │   ├───routes
│   │   └───themes
│   ├───core  => all config files will save here like constant and etc
│   │   └───utils
│   ├───data  => its part of clean architect and will handle communication to storage via floor
│   │   └───data_sources
│   │       ├───locnal
│   │       │   └───DAOs
│   │       ├───models
│   │       └───repositories
│   ├───domain => domain layer handle logic of project 
│   │   ├───entities
│   │   ├───repositories
│   │   └───usecase
│   └───presentation => it has responsibility to render and hold files which are related to ui 
├───test
</pre>
