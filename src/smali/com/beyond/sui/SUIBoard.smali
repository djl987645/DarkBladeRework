.class Lcom/beyond/sui/SUIBoard;
.super Lcom/beyond/sui/SUIBase;
.source "SUIBoard.java"


# instance fields
.field color:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 14
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/beyond/sui/SUIBoard;->color:I

    .line 13
    return-void
.end method


# virtual methods
.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 5
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    .line 24
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v2

    .line 25
    .local v2, "v":Ljava/util/Vector;
    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_1

    .line 31
    const/4 v3, 0x1

    return v3

    .line 26
    :cond_1
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnanoxml/XMLElement;

    .line 27
    .local v0, "el":Lnanoxml/XMLElement;
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "color"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 28
    invoke-virtual {p0, v0}, Lcom/beyond/sui/SUIBoard;->getColor(Lnanoxml/XMLElement;)I

    move-result v3

    iput v3, p0, Lcom/beyond/sui/SUIBoard;->color:I

    goto :goto_0
.end method

.method paint(Landroid/graphics/Canvas;Lcom/beyond/sui/SUIComponent;)V
    .locals 2
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "c"    # Lcom/beyond/sui/SUIComponent;

    .prologue
    .line 17
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 18
    .local v0, "paint":Landroid/graphics/Paint;
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 19
    iget v1, p0, Lcom/beyond/sui/SUIBoard;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 20
    iget-object v1, p2, Lcom/beyond/sui/SUIComponent;->rect:Landroid/graphics/Rect;

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 21
    return-void
.end method
