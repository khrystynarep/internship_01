#!/bin/bash

echo "🔍 Checking environment requirements..."

# Check Git
echo -n "Git: "; git --version || echo "❌ Not installed"

# Check Java
echo -n "Java: "; java -version 2>&1 | head -n 1 || echo "❌ Not installed"

# Check Gradle
echo -n "Gradle: "; gradle -v | grep Gradle || echo "❌ Not installed"

# Check PostgreSQL
echo -n "PostgreSQL: "; psql --version || echo "❌ Not installed"

# Check Redis
echo -n "Redis: "; redis-server --version || echo "❌ Not installed"

# Check Node
echo -n "Node.js: "; node -v || echo "❌ Not installed"

# Check npm
echo -n "npm: "; npm -v || echo "❌ Not installed"

# Optional: check Tomcat directory (if applicable)
if [ -d "/opt/tomcat" ]; then
  echo "Tomcat: ✅ Found in /opt/tomcat"
else
  echo "Tomcat: ❌ Not found"
fi

echo "✅ Environment check finished"
