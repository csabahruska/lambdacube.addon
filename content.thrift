namespace hs Thrift.

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

// run on iPad
service ContentConsumer
{
    void meshChanged(1: string name)
}

// run in blender
service ContentProvider
{
    Mesh downloadMesh(1: string name)
}
