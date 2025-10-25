#!/bin/sh
# Minimal downloader to fetch Gradle distribution and run it
WRAPPER_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$WRAPPER_DIR/.." && pwd)"
PROPS="$WRAPPER_DIR/gradle-wrapper.properties"
DIST_URL=$(grep distributionUrl "$PROPS" | cut -d'=' -f2-)
CACHE_DIR="$HOME/.gradle/wrapper/dists"
DIST_NAME=$(basename "$DIST_URL")
DIST_DIR="$CACHE_DIR/$(echo "$DIST_URL" | sha1sum | cut -d' ' -f1)/$DIST_NAME"
mkdir -p "$DIST_DIR"
if [ ! -f "$DIST_DIR/$DIST_NAME" ]; then
  echo "Downloading $DIST_URL"
  curl -L -o "$DIST_DIR/$DIST_NAME" "$DIST_URL"
fi
TMPDIR=$(mktemp -d)
unzip -q "$DIST_DIR/$DIST_NAME" -d "$TMPDIR"
GRADLE_BIN=$(find "$TMPDIR" -type f -path '*/bin/gradle' | head -n1)
if [ -z "$GRADLE_BIN" ]; then
  echo "gradle binary not found in distribution" >&2
  exit 1
fi
exec "$GRADLE_BIN" "$@"
