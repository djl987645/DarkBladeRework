.class Lcom/beyond/sui/SUIView;
.super Lcom/beyond/sui/SUIBase;
.source "SUIView.java"


# static fields
.field static displayHeight:I

.field static displayWidth:I


# instance fields
.field private components:Ljava/util/Vector;

.field xmlPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 26
    sput v0, Lcom/beyond/sui/SUIView;->displayWidth:I

    .line 27
    sput v0, Lcom/beyond/sui/SUIView;->displayHeight:I

    .line 24
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 30
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUIView;->components:Ljava/util/Vector;

    .line 24
    return-void
.end method


# virtual methods
.method loadXml(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "xmlName"    # Ljava/lang/String;

    .prologue
    .line 50
    const/4 v1, 0x0

    .line 51
    .local v1, "configXml":Lnanoxml/XMLElement;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 52
    .local v6, "xml":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .line 53
    .local v4, "is":Ljava/io/InputStream;
    iput-object p2, p0, Lcom/beyond/sui/SUIView;->xmlPath:Ljava/lang/String;

    .line 55
    :try_start_0
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "res_pad/"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/beyond/sui/SUIView;->xmlPath:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 56
    .local v5, "path":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v5, v8}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v4

    .line 57
    if-nez v4, :cond_1

    .line 58
    const/4 v7, 0x0

    .line 74
    .end local v5    # "path":Ljava/lang/String;
    :goto_0
    return v7

    .line 61
    .restart local v5    # "path":Ljava/lang/String;
    :cond_0
    invoke-virtual {v4}, Ljava/io/InputStream;->available()I

    move-result v7

    new-array v0, v7, [B

    .line 62
    .local v0, "b":[B
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    .line 63
    new-instance v7, Ljava/lang/String;

    const-string v8, "EUC-KR"

    invoke-direct {v7, v0, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 60
    .end local v0    # "b":[B
    :cond_1
    invoke-virtual {v4}, Ljava/io/InputStream;->available()I

    move-result v7

    if-gtz v7, :cond_0

    .line 65
    new-instance v2, Lnanoxml/XMLElement;

    invoke-direct {v2}, Lnanoxml/XMLElement;-><init>()V
    :try_end_0
    .catch Lnanoxml/XMLParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 66
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

    .line 74
    .end local v2    # "configXml":Lnanoxml/XMLElement;
    .end local v5    # "path":Ljava/lang/String;
    .restart local v1    # "configXml":Lnanoxml/XMLElement;
    :goto_1
    invoke-virtual {p0, v1, p0}, Lcom/beyond/sui/SUIView;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v7

    goto :goto_0

    .line 67
    :catch_0
    move-exception v3

    .line 68
    .local v3, "e":Lnanoxml/XMLParseException;
    :goto_2
    invoke-virtual {v3}, Lnanoxml/XMLParseException;->printStackTrace()V

    goto :goto_1

    .line 69
    .end local v3    # "e":Lnanoxml/XMLParseException;
    :catch_1
    move-exception v3

    .line 70
    .local v3, "e":Ljava/lang/Exception;
    :goto_3
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 69
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

    .line 67
    .end local v1    # "configXml":Lnanoxml/XMLElement;
    .restart local v2    # "configXml":Lnanoxml/XMLElement;
    :catch_3
    move-exception v3

    move-object v1, v2

    .end local v2    # "configXml":Lnanoxml/XMLElement;
    .restart local v1    # "configXml":Lnanoxml/XMLElement;
    goto :goto_2
.end method

.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 8
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    .line 78
    const-string v6, "is_scale"

    const/4 v7, 0x0

    invoke-static {p1, v6, v7}, Lcom/beyond/sui/SUIView;->getBoolean(Lnanoxml/XMLElement;Ljava/lang/String;Z)Z

    move-result v4

    .line 79
    .local v4, "is_scalse":Z
    if-eqz v4, :cond_2

    .line 82
    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->isClet()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 83
    sget-object v6, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    const-string v7, "window"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/WindowManager;

    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 87
    .local v1, "display":Landroid/view/Display;
    :goto_0
    sget v6, Lcom/beyond/sui/SUIView;->displayWidth:I

    if-nez v6, :cond_0

    .line 88
    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v6

    sput v6, Lcom/beyond/sui/SUIView;->displayWidth:I

    .line 89
    :cond_0
    sget v6, Lcom/beyond/sui/SUIView;->displayHeight:I

    if-nez v6, :cond_1

    .line 90
    invoke-virtual {v1}, Landroid/view/Display;->getHeight()I

    move-result v6

    sput v6, Lcom/beyond/sui/SUIView;->displayHeight:I

    .line 91
    :cond_1
    sget v6, Lcom/beyond/sui/SUIView;->displayWidth:I

    mul-int/lit8 v6, v6, 0x64

    iget-object v7, p0, Lcom/beyond/sui/SUIView;->rect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v7

    div-int/2addr v6, v7

    iput v6, p0, Lcom/beyond/sui/SUIView;->scalex:I

    .line 92
    sget v6, Lcom/beyond/sui/SUIView;->displayHeight:I

    mul-int/lit8 v6, v6, 0x64

    iget-object v7, p0, Lcom/beyond/sui/SUIView;->rect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v7

    div-int/2addr v6, v7

    iput v6, p0, Lcom/beyond/sui/SUIView;->scaley:I

    .line 94
    iget-object v6, p0, Lcom/beyond/sui/SUIView;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0, v6}, Lcom/beyond/sui/SUIView;->getScaledRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v6

    iput-object v6, p0, Lcom/beyond/sui/SUIView;->rect:Landroid/graphics/Rect;

    .line 97
    .end local v1    # "display":Landroid/view/Display;
    :cond_2
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v5

    .line 98
    .local v5, "v":Ljava/util/Vector;
    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "en":Ljava/util/Enumeration;
    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-nez v6, :cond_5

    .line 107
    const/4 v6, 0x1

    return v6

    .line 85
    .end local v3    # "en":Ljava/util/Enumeration;
    .end local v5    # "v":Ljava/util/Vector;
    :cond_4
    sget-object v6, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    const-string v7, "window"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/WindowManager;

    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .restart local v1    # "display":Landroid/view/Display;
    goto :goto_0

    .line 99
    .end local v1    # "display":Landroid/view/Display;
    .restart local v3    # "en":Ljava/util/Enumeration;
    .restart local v5    # "v":Ljava/util/Vector;
    :cond_5
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnanoxml/XMLElement;

    .line 100
    .local v2, "el":Lnanoxml/XMLElement;
    invoke-virtual {v2}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "component"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 101
    new-instance v0, Lcom/beyond/sui/SUIComponent;

    invoke-direct {v0}, Lcom/beyond/sui/SUIComponent;-><init>()V

    .line 102
    .local v0, "c":Lcom/beyond/sui/SUIComponent;
    invoke-virtual {v0, v2, p0}, Lcom/beyond/sui/SUIComponent;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 103
    iget-object v6, p0, Lcom/beyond/sui/SUIView;->components:Ljava/util/Vector;

    invoke-virtual {v6, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method protected mouseEvnet(ILandroid/view/MotionEvent;Landroid/graphics/Rect;Landroid/view/View;)I
    .locals 4
    .param p1, "event"    # I
    .param p2, "arg0"    # Landroid/view/MotionEvent;
    .param p3, "rc"    # Landroid/graphics/Rect;
    .param p4, "jc"    # Landroid/view/View;

    .prologue
    .line 40
    const/4 v2, 0x0

    .line 41
    .local v2, "ret":I
    iget-object v3, p0, Lcom/beyond/sui/SUIView;->components:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_1

    .line 46
    const/4 v3, 0x0

    :goto_0
    return v3

    .line 42
    :cond_1
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIComponent;

    .line 43
    .local v0, "el":Lcom/beyond/sui/SUIComponent;
    invoke-virtual {v0, p2, p3, p1, p4}, Lcom/beyond/sui/SUIComponent;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    if-lez v2, :cond_0

    move v3, v2

    .line 44
    goto :goto_0
.end method

.method protected onGetValue(ILjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "componentType"    # I
    .param p2, "n"    # Ljava/lang/String;

    .prologue
    .line 111
    const/4 v3, 0x1

    if-ne p1, v3, :cond_0

    .line 112
    invoke-virtual {p0, p2}, Lcom/beyond/sui/SUIView;->getValueStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 124
    :goto_0
    return-object v2

    .line 114
    :cond_0
    const/4 v3, 0x6

    if-ne p1, v3, :cond_1

    .line 115
    invoke-virtual {p0}, Lcom/beyond/sui/SUIView;->getNameStr()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 118
    :cond_1
    iget-object v3, p0, Lcom/beyond/sui/SUIView;->components:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_2
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_3

    .line 124
    const/4 v2, 0x0

    goto :goto_0

    .line 119
    :cond_3
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIComponent;

    .line 121
    .local v0, "el":Lcom/beyond/sui/SUIComponent;
    invoke-virtual {v0, p1, p2}, Lcom/beyond/sui/SUIComponent;->onGetValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .local v2, "ret":Ljava/lang/String;
    if-eqz v2, :cond_2

    goto :goto_0
.end method

.method protected onSetValue(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p1, "componentType"    # I
    .param p2, "n"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 128
    if-ne p1, v2, :cond_1

    .line 129
    invoke-virtual {p0, p2, p3}, Lcom/beyond/sui/SUIView;->setValueStr(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    .line 140
    :cond_0
    :goto_0
    return v2

    .line 131
    :cond_1
    const/4 v3, 0x6

    if-eq p1, v3, :cond_0

    .line 135
    iget-object v3, p0, Lcom/beyond/sui/SUIView;->components:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_2
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_3

    .line 140
    const/4 v2, 0x0

    goto :goto_0

    .line 136
    :cond_3
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIComponent;

    .line 137
    .local v0, "el":Lcom/beyond/sui/SUIComponent;
    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIComponent;->onSetValue(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 3
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 33
    iget-object v2, p0, Lcom/beyond/sui/SUIView;->components:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-nez v2, :cond_0

    .line 37
    return-void

    .line 34
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIComponent;

    .line 35
    .local v0, "el":Lcom/beyond/sui/SUIComponent;
    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIComponent;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0
.end method

.method setSuiAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p1, "cmpName"    # Ljava/lang/String;
    .param p2, "attr"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 160
    invoke-super {p0, p1, p2, p3}, Lcom/beyond/sui/SUIBase;->setSuiAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 170
    :goto_0
    return v2

    .line 162
    :cond_0
    iget-object v3, p0, Lcom/beyond/sui/SUIView;->components:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_2

    .line 170
    const/4 v2, 0x0

    goto :goto_0

    .line 164
    :cond_2
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIComponent;

    .line 165
    .local v0, "el":Lcom/beyond/sui/SUIComponent;
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIComponent;->setSuiAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0
.end method
