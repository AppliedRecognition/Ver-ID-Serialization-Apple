# Ver-ID Serialization

### Serialization of common Ver-ID types using protocol buffers

The framework contains extensions that add conformance to the framework's Serializable protocol, making it trivial to efficiently serialize and deserialize common Ver-ID types.

## Installation using CocoaPods

In your **Podfile** add:

```
pod 'Ver-ID-Serialization', '~> 1.0'
```

## Usage example

```swift
import VerIDCore
import VerIDSerialization

let face: Face // Face detected by Ver-ID

// Serialize an instance of Face
let serialized: Data = try face.serialized()

// Deserialize an instance of Face
let deserialized: Face = try Deserializer.deserialize(serialized)
```

## Types

The framework adds conformance to the [Serializable](./VerIDSerialization/Serializable.swift) protocol on the following Ver-ID types:

- Image
- Face
- RecognizableFace
- SystemInfo
- Registration
- Capture*

**Capture type is introduced in the VerIDSerialization framework. It facilitates sharing of captured images and faces.*
