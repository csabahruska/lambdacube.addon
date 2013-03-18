namespace hs Thrift.

// Mesh
enum AttributeType {
    AT_Float,
    AT_Vec2,
    AT_Vec3,
    AT_Vec4,
    AT_Mat2,
    AT_Mat3,
    AT_Mat4
    AT_Int,
    AT_Word
}

enum PrimitiveType {
    PT_Points,
    PT_TriangleStrip,
    PT_Triangles
}

struct VertexAttribute {
    1: string attrName,
    2: AttributeType attrType,
    3: list<binary> attrData
}

struct Mesh {
    1: list<VertexAttribute> attributes,
    2: PrimitiveType primitive,
    3: optional list<binary> indexData
}

// Image
enum ImageType {
    IT_RGBA8,
    IT_RGBAF,
    IT_JPG,
    IT_PNG
}

// Property type
enum PropertyType {
    PT_Bool,
    PT_Float,
    PT_Int,
    PT_String,
    PT_Unsupported
}

struct Property {
    1: string propertyTypeName,
    2: PropertyType propertyType,
    3: i16 propertySize,
    4: binary propertyData
}

// run in blender
service ContentProvider
{
    Mesh            downloadMesh(1: string name),
    list<binary>    downloadTexture(1: string name, 2: ImageType imageType, 3: i16 width, 4: i16 height),
    list<string>    downloadGroup(1: string name),
    list<Property>  query(1: list<string> dataPaths)
}
