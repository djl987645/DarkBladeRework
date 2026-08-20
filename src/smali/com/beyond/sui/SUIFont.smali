.class Lcom/beyond/sui/SUIFont;
.super Lcom/beyond/sui/SUIBase;
.source "SUIFont.java"


# static fields
.field static fonts:Ljava/util/Vector;


# instance fields
.field private _fChars:[Lcom/beyond/sui/FontChar;

.field private _fCharsKFC:[Lcom/beyond/sui/FontChar;

.field private _fCharsKFL:[Lcom/beyond/sui/FontChar;

.field private _fCharsKL:[Lcom/beyond/sui/FontChar;

.field private _fCharsKM:[Lcom/beyond/sui/FontChar;

.field private image_font:Landroid/graphics/Bitmap;

.field xmlPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lcom/beyond/sui/SUIFont;->fonts:Ljava/util/Vector;

    .line 21
    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    const/16 v1, 0x14

    .line 21
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/sui/SUIFont;->image_font:Landroid/graphics/Bitmap;

    .line 29
    new-array v0, v1, [Lcom/beyond/sui/FontChar;

    iput-object v0, p0, Lcom/beyond/sui/SUIFont;->_fCharsKFL:[Lcom/beyond/sui/FontChar;

    .line 30
    new-array v0, v1, [Lcom/beyond/sui/FontChar;

    iput-object v0, p0, Lcom/beyond/sui/SUIFont;->_fCharsKFC:[Lcom/beyond/sui/FontChar;

    .line 31
    const/16 v0, 0x19

    new-array v0, v0, [Lcom/beyond/sui/FontChar;

    iput-object v0, p0, Lcom/beyond/sui/SUIFont;->_fCharsKM:[Lcom/beyond/sui/FontChar;

    .line 32
    const/16 v0, 0x1e

    new-array v0, v0, [Lcom/beyond/sui/FontChar;

    iput-object v0, p0, Lcom/beyond/sui/SUIFont;->_fCharsKL:[Lcom/beyond/sui/FontChar;

    .line 21
    return-void
.end method

.method private findChar(C)Lcom/beyond/sui/FontChar;
    .locals 2
    .param p1, "c"    # C

    .prologue
    .line 163
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/beyond/sui/SUIFont;->_fChars:[Lcom/beyond/sui/FontChar;

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 167
    const/4 v1, 0x0

    :goto_1
    return-object v1

    .line 164
    :cond_0
    iget-object v1, p0, Lcom/beyond/sui/SUIFont;->_fChars:[Lcom/beyond/sui/FontChar;

    aget-object v1, v1, v0

    iget-char v1, v1, Lcom/beyond/sui/FontChar;->code:C

    if-ne v1, p1, :cond_1

    .line 165
    iget-object v1, p0, Lcom/beyond/sui/SUIFont;->_fChars:[Lcom/beyond/sui/FontChar;

    aget-object v1, v1, v0

    goto :goto_1

    .line 163
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method static load(Landroid/content/Context;Ljava/lang/String;)Lcom/beyond/sui/SUIFont;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "xmlName"    # Ljava/lang/String;

    .prologue
    .line 171
    sget-object v3, Lcom/beyond/sui/SUIFont;->fonts:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_1

    .line 176
    new-instance v2, Lcom/beyond/sui/SUIFont;

    invoke-direct {v2}, Lcom/beyond/sui/SUIFont;-><init>()V

    .line 177
    .local v2, "f":Lcom/beyond/sui/SUIFont;
    invoke-direct {v2, p0, p1}, Lcom/beyond/sui/SUIFont;->loadXml(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 178
    sget-object v3, Lcom/beyond/sui/SUIFont;->fonts:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    move-object v0, v2

    .line 181
    .end local v2    # "f":Lcom/beyond/sui/SUIFont;
    :goto_0
    return-object v0

    .line 172
    :cond_1
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIFont;

    .line 173
    .local v0, "el":Lcom/beyond/sui/SUIFont;
    iget-object v3, v0, Lcom/beyond/sui/SUIFont;->xmlPath:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 181
    .end local v0    # "el":Lcom/beyond/sui/SUIFont;
    .restart local v2    # "f":Lcom/beyond/sui/SUIFont;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private loadXml(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "xmlName"    # Ljava/lang/String;

    .prologue
    .line 190
    const/4 v1, 0x0

    .line 191
    .local v1, "configXml":Lnanoxml/XMLElement;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 192
    .local v6, "xml":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .line 193
    .local v4, "is":Ljava/io/InputStream;
    iput-object p2, p0, Lcom/beyond/sui/SUIFont;->xmlPath:Ljava/lang/String;

    .line 195
    :try_start_0
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "res_pad/"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 196
    .local v5, "path":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v5, v8}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v4

    .line 197
    if-nez v4, :cond_1

    .line 198
    const/4 v7, 0x0

    .line 214
    .end local v5    # "path":Ljava/lang/String;
    :goto_0
    return v7

    .line 201
    .restart local v5    # "path":Ljava/lang/String;
    :cond_0
    invoke-virtual {v4}, Ljava/io/InputStream;->available()I

    move-result v7

    new-array v0, v7, [B

    .line 202
    .local v0, "b":[B
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    .line 203
    new-instance v7, Ljava/lang/String;

    const-string v8, "EUC-KR"

    invoke-direct {v7, v0, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 200
    .end local v0    # "b":[B
    :cond_1
    invoke-virtual {v4}, Ljava/io/InputStream;->available()I

    move-result v7

    if-gtz v7, :cond_0

    .line 205
    new-instance v2, Lnanoxml/XMLElement;

    invoke-direct {v2}, Lnanoxml/XMLElement;-><init>()V
    :try_end_0
    .catch Lnanoxml/XMLParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 206
    .end local v1    # "configXml":Lnanoxml/XMLElement;
    .local v2, "configXml":Lnanoxml/XMLElement;
    :try_start_1
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Lnanoxml/XMLElement;->parseString(Ljava/lang/String;)V
    :try_end_1
    .catch Lnanoxml/XMLParseException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-object v1, v2

    .line 214
    .end local v2    # "configXml":Lnanoxml/XMLElement;
    .end local v5    # "path":Ljava/lang/String;
    .restart local v1    # "configXml":Lnanoxml/XMLElement;
    :goto_1
    invoke-virtual {p0, v1, p0}, Lcom/beyond/sui/SUIFont;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v7

    goto :goto_0

    .line 207
    :catch_0
    move-exception v3

    .line 208
    .local v3, "e":Lnanoxml/XMLParseException;
    :goto_2
    invoke-virtual {v3}, Lnanoxml/XMLParseException;->printStackTrace()V

    goto :goto_1

    .line 209
    .end local v3    # "e":Lnanoxml/XMLParseException;
    :catch_1
    move-exception v3

    .line 210
    .local v3, "e":Ljava/lang/Exception;
    :goto_3
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 209
    .end local v1    # "configXml":Lnanoxml/XMLElement;
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v2    # "configXml":Lnanoxml/XMLElement;
    .restart local v5    # "path":Ljava/lang/String;
    :catch_2
    move-exception v3

    move-object v1, v2

    .end local v2    # "configXml":Lnanoxml/XMLElement;
    .restart local v1    # "configXml":Lnanoxml/XMLElement;
    goto :goto_3

    .line 207
    .end local v1    # "configXml":Lnanoxml/XMLElement;
    .restart local v2    # "configXml":Lnanoxml/XMLElement;
    :catch_3
    move-exception v3

    move-object v1, v2

    .end local v2    # "configXml":Lnanoxml/XMLElement;
    .restart local v1    # "configXml":Lnanoxml/XMLElement;
    goto :goto_2
.end method

.method static unloadAll()V
    .locals 1

    .prologue
    .line 185
    sget-object v0, Lcom/beyond/sui/SUIFont;->fonts:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 186
    return-void
.end method


# virtual methods
.method public drawString(Landroid/graphics/Canvas;Ljava/lang/String;IIIILandroid/graphics/Paint;)V
    .locals 19
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "str"    # Ljava/lang/String;
    .param p3, "x"    # I
    .param p4, "y"    # I
    .param p5, "anchor"    # I
    .param p6, "fontSize"    # I
    .param p7, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 105
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v10

    .line 107
    .local v10, "chCount":I
    const/4 v12, 0x0

    .line 109
    .local v12, "drawedWidth":I
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    if-lt v15, v10, :cond_1

    .line 160
    :cond_0
    return-void

    .line 110
    :cond_1
    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 111
    .local v9, "ch":C
    const v3, 0xac00

    if-lt v9, v3, :cond_8

    const v3, 0xd7a3

    if-gt v9, v3, :cond_8

    .line 113
    const v3, 0xac00

    sub-int v3, v9, v3

    int-to-char v9, v3

    .line 114
    rem-int/lit8 v17, v9, 0x1c

    .line 115
    .local v17, "jongIndex":I
    sub-int v3, v9, v17

    div-int/lit8 v3, v3, 0x1c

    rem-int/lit8 v18, v3, 0x15

    .line 116
    .local v18, "jungIndex":I
    sub-int v3, v9, v17

    div-int/lit8 v3, v3, 0x1c

    div-int/lit8 v11, v3, 0x15

    .line 117
    .local v11, "choIndex":I
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 119
    const/4 v1, 0x0

    .line 120
    .local v1, "fCharF":Lcom/beyond/sui/FontChar;
    const/4 v14, 0x0

    .line 121
    .local v14, "fCharM":Lcom/beyond/sui/FontChar;
    const/4 v13, 0x0

    .line 123
    .local v13, "fCharL":Lcom/beyond/sui/FontChar;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIFont;->_fCharsKM:[Lcom/beyond/sui/FontChar;

    aget-object v14, v3, v18

    .line 124
    iget v3, v14, Lcom/beyond/sui/FontChar;->kMidlePos:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_7

    .line 125
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIFont;->_fCharsKFC:[Lcom/beyond/sui/FontChar;

    aget-object v1, v3, v11

    .line 129
    :goto_1
    const/16 v16, 0x0

    .line 130
    .local v16, "isExistLast":Z
    if-lez v17, :cond_2

    .line 131
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIFont;->_fCharsKL:[Lcom/beyond/sui/FontChar;

    aget-object v13, v3, v17

    .line 132
    const/16 v16, 0x1

    .line 135
    :cond_2
    if-eqz v1, :cond_0

    if-eqz v14, :cond_0

    .line 138
    if-eqz v1, :cond_3

    .line 140
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIFont;->image_font:Landroid/graphics/Bitmap;

    move-object/from16 v2, p1

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p6

    move-object/from16 v7, p7

    invoke-virtual/range {v1 .. v7}, Lcom/beyond/sui/FontChar;->drawChar(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;IIILandroid/graphics/Paint;)I

    move-result v12

    .line 141
    :cond_3
    if-eqz v14, :cond_4

    .line 142
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/beyond/sui/SUIFont;->image_font:Landroid/graphics/Bitmap;

    move-object v2, v14

    move-object/from16 v3, p1

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p6

    move-object/from16 v8, p7

    invoke-virtual/range {v2 .. v8}, Lcom/beyond/sui/FontChar;->drawChar(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;IIILandroid/graphics/Paint;)I

    move-result v12

    .line 144
    :cond_4
    if-eqz v13, :cond_5

    .line 145
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/beyond/sui/SUIFont;->image_font:Landroid/graphics/Bitmap;

    move-object v2, v13

    move-object/from16 v3, p1

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p6

    move-object/from16 v8, p7

    invoke-virtual/range {v2 .. v8}, Lcom/beyond/sui/FontChar;->drawChar(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;IIILandroid/graphics/Paint;)I

    move-result v12

    .line 147
    :cond_5
    add-int p3, p3, v12

    .line 109
    .end local v1    # "fCharF":Lcom/beyond/sui/FontChar;
    .end local v11    # "choIndex":I
    .end local v13    # "fCharL":Lcom/beyond/sui/FontChar;
    .end local v14    # "fCharM":Lcom/beyond/sui/FontChar;
    .end local v16    # "isExistLast":Z
    .end local v17    # "jongIndex":I
    .end local v18    # "jungIndex":I
    :cond_6
    :goto_2
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_0

    .line 127
    .restart local v1    # "fCharF":Lcom/beyond/sui/FontChar;
    .restart local v11    # "choIndex":I
    .restart local v13    # "fCharL":Lcom/beyond/sui/FontChar;
    .restart local v14    # "fCharM":Lcom/beyond/sui/FontChar;
    .restart local v17    # "jongIndex":I
    .restart local v18    # "jungIndex":I
    :cond_7
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIFont;->_fCharsKFL:[Lcom/beyond/sui/FontChar;

    aget-object v1, v3, v11

    goto :goto_1

    .line 149
    .end local v1    # "fCharF":Lcom/beyond/sui/FontChar;
    .end local v11    # "choIndex":I
    .end local v13    # "fCharL":Lcom/beyond/sui/FontChar;
    .end local v14    # "fCharM":Lcom/beyond/sui/FontChar;
    .end local v17    # "jongIndex":I
    .end local v18    # "jungIndex":I
    :cond_8
    const/16 v3, 0x20

    if-ne v9, v3, :cond_9

    .line 150
    div-int/lit8 v3, p6, 0x2

    add-int p3, p3, v3

    goto :goto_2

    .line 153
    :cond_9
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/beyond/sui/SUIFont;->findChar(C)Lcom/beyond/sui/FontChar;

    move-result-object v2

    .line 154
    .local v2, "fChar":Lcom/beyond/sui/FontChar;
    if-eqz v2, :cond_6

    .line 155
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/beyond/sui/SUIFont;->image_font:Landroid/graphics/Bitmap;

    move-object/from16 v3, p1

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p6

    move-object/from16 v8, p7

    invoke-virtual/range {v2 .. v8}, Lcom/beyond/sui/FontChar;->drawChar(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;IIILandroid/graphics/Paint;)I

    move-result v12

    .line 156
    add-int p3, p3, v12

    goto :goto_2
.end method

.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 12
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    .line 36
    const-string v10, "image"

    invoke-virtual {p1, v10}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/beyond/sui/SUIFont;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v10

    iput-object v10, p0, Lcom/beyond/sui/SUIFont;->image_font:Landroid/graphics/Bitmap;

    .line 37
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    .line 38
    .local v9, "vFontChar":Ljava/util/Vector;
    const/4 v0, 0x0

    .line 40
    .local v0, "charCount":I
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v8

    .line 41
    .local v8, "v":Ljava/util/Vector;
    invoke-virtual {v8}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-nez v10, :cond_1

    .line 50
    new-array v10, v0, [Lcom/beyond/sui/FontChar;

    iput-object v10, p0, Lcom/beyond/sui/SUIFont;->_fChars:[Lcom/beyond/sui/FontChar;

    .line 51
    const/4 v5, 0x0

    .line 52
    .local v5, "ix":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v10

    if-lt v4, v10, :cond_2

    .line 58
    const/4 v10, 0x1

    return v10

    .line 42
    .end local v4    # "i":I
    .end local v5    # "ix":I
    :cond_1
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnanoxml/XMLElement;

    .line 43
    .local v1, "el":Lnanoxml/XMLElement;
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v10

    const-string v11, "font"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 44
    invoke-virtual {p0, v1}, Lcom/beyond/sui/SUIFont;->makeFontChars(Lnanoxml/XMLElement;)[Lcom/beyond/sui/FontChar;

    move-result-object v3

    .line 45
    .local v3, "fc":[Lcom/beyond/sui/FontChar;
    invoke-virtual {v9, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 46
    array-length v10, v3

    add-int/2addr v0, v10

    goto :goto_0

    .line 53
    .end local v1    # "el":Lnanoxml/XMLElement;
    .end local v3    # "fc":[Lcom/beyond/sui/FontChar;
    .restart local v4    # "i":I
    .restart local v5    # "ix":I
    :cond_2
    invoke-virtual {v9, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/beyond/sui/FontChar;

    .line 54
    .restart local v3    # "fc":[Lcom/beyond/sui/FontChar;
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_2
    array-length v10, v3

    if-lt v7, v10, :cond_3

    .line 52
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 55
    :cond_3
    iget-object v10, p0, Lcom/beyond/sui/SUIFont;->_fChars:[Lcom/beyond/sui/FontChar;

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "ix":I
    .local v6, "ix":I
    aget-object v11, v3, v7

    aput-object v11, v10, v5

    .line 54
    add-int/lit8 v7, v7, 0x1

    move v5, v6

    .end local v6    # "ix":I
    .restart local v5    # "ix":I
    goto :goto_2
.end method

.method makeFontChars(Lnanoxml/XMLElement;)[Lcom/beyond/sui/FontChar;
    .locals 14
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    const/4 v13, -0x1

    .line 62
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v10

    .line 63
    .local v10, "v":Ljava/util/Vector;
    const-string v11, "chars"

    invoke-virtual {p1, v11}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "chars":Ljava/lang/String;
    const-string v11, "type"

    invoke-virtual {p1, v11}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 65
    .local v9, "type":Ljava/lang/String;
    const-string v11, "char_width"

    invoke-virtual {p1, v11}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    .line 66
    .local v0, "char_width":I
    const-string v11, "space"

    invoke-virtual {p1, v11}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v8

    .line 67
    .local v8, "space":I
    const/4 v7, 0x0

    .line 68
    .local v7, "rc":Landroid/graphics/Rect;
    invoke-virtual {v10}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-nez v11, :cond_2

    .line 75
    if-nez v7, :cond_3

    .line 76
    const/4 v5, 0x0

    .line 101
    :cond_1
    return-object v5

    .line 69
    :cond_2
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnanoxml/XMLElement;

    .line 70
    .local v2, "el":Lnanoxml/XMLElement;
    invoke-virtual {v2}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "rect"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 71
    invoke-virtual {p0, v2}, Lcom/beyond/sui/SUIFont;->getRect(Lnanoxml/XMLElement;)Landroid/graphics/Rect;

    move-result-object v7

    goto :goto_0

    .line 78
    .end local v2    # "el":Lnanoxml/XMLElement;
    :cond_3
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v11

    new-array v5, v11, [Lcom/beyond/sui/FontChar;

    .line 80
    .local v5, "fChars":[Lcom/beyond/sui/FontChar;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v11

    if-ge v6, v11, :cond_1

    .line 81
    new-instance v4, Lcom/beyond/sui/FontChar;

    invoke-direct {v4}, Lcom/beyond/sui/FontChar;-><init>()V

    .line 82
    .local v4, "fChar":Lcom/beyond/sui/FontChar;
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v11

    iput-char v11, v4, Lcom/beyond/sui/FontChar;->code:C

    .line 83
    iget v11, v7, Landroid/graphics/Rect;->left:I

    add-int v12, v0, v8

    mul-int/2addr v12, v6

    add-int/2addr v11, v12

    iput v11, v4, Lcom/beyond/sui/FontChar;->x:I

    .line 84
    iget v11, v7, Landroid/graphics/Rect;->top:I

    iput v11, v4, Lcom/beyond/sui/FontChar;->y:I

    .line 85
    iput v0, v4, Lcom/beyond/sui/FontChar;->width:I

    .line 86
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v11

    iput v11, v4, Lcom/beyond/sui/FontChar;->height:I

    .line 87
    if-eqz v9, :cond_4

    .line 88
    invoke-virtual {v4, v9}, Lcom/beyond/sui/FontChar;->setKorIndex(Ljava/lang/String;)V

    .line 90
    :cond_4
    aput-object v4, v5, v6

    .line 91
    iget v11, v4, Lcom/beyond/sui/FontChar;->kIxFirstL:I

    if-eq v11, v13, :cond_5

    .line 92
    iget-object v11, p0, Lcom/beyond/sui/SUIFont;->_fCharsKFL:[Lcom/beyond/sui/FontChar;

    iget v12, v4, Lcom/beyond/sui/FontChar;->kIxFirstL:I

    aput-object v4, v11, v12

    .line 93
    :cond_5
    iget v11, v4, Lcom/beyond/sui/FontChar;->kIxFirstC:I

    if-eq v11, v13, :cond_6

    .line 94
    iget-object v11, p0, Lcom/beyond/sui/SUIFont;->_fCharsKFC:[Lcom/beyond/sui/FontChar;

    iget v12, v4, Lcom/beyond/sui/FontChar;->kIxFirstC:I

    aput-object v4, v11, v12

    .line 95
    :cond_6
    iget v11, v4, Lcom/beyond/sui/FontChar;->kIxMidle:I

    if-eq v11, v13, :cond_7

    .line 96
    iget-object v11, p0, Lcom/beyond/sui/SUIFont;->_fCharsKM:[Lcom/beyond/sui/FontChar;

    iget v12, v4, Lcom/beyond/sui/FontChar;->kIxMidle:I

    aput-object v4, v11, v12

    .line 97
    :cond_7
    iget v11, v4, Lcom/beyond/sui/FontChar;->kIxLast:I

    if-eq v11, v13, :cond_8

    .line 98
    iget-object v11, p0, Lcom/beyond/sui/SUIFont;->_fCharsKL:[Lcom/beyond/sui/FontChar;

    iget v12, v4, Lcom/beyond/sui/FontChar;->kIxLast:I

    aput-object v4, v11, v12

    .line 80
    :cond_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_1
.end method
