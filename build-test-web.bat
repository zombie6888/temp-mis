Call flutter config --build-dir="build-test"
Call flutter build web --dart-define web-env=test --web-renderer canvaskit 
CALL firebase deploy --only hosting:test    
Call flutter config --build-dir="build"