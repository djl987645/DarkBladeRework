.class Lcom/beyond/sui/SUIText;
.super Lcom/beyond/sui/SUIBase;
.source "SUIText.java"


# instance fields
.field color:I

.field isFlick:Z

.field private isSwipShow:Z

.field size:I

.field str:Ljava/lang/String;

.field private suiFont:Lcom/beyond/sui/SUIFont;

.field swipView:Lcom/beyond/sui/SUIView;

.field swip_str:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 20
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 22
    const/16 v0, 0xa

    iput v0, p0, Lcom/beyond/sui/SUIText;->size:I

    .line 23
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/beyond/sui/SUIText;->color:I

    .line 24
    iput-boolean v2, p0, Lcom/beyond/sui/SUIText;->isFlick:Z

    .line 25
    iput-object v1, p0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    .line 26
    iput-object v1, p0, Lcom/beyond/sui/SUIText;->swip_str:Ljava/lang/String;

    .line 27
    iput-boolean v2, p0, Lcom/beyond/sui/SUIText;->isSwipShow:Z

    .line 28
    iput-object v1, p0, Lcom/beyond/sui/SUIText;->suiFont:Lcom/beyond/sui/SUIFont;

    .line 20
    return-void
.end method


# virtual methods
.method protected makeAttr(Lnanoxml/XMLElement;)V
    .locals 3
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 87
    const-string v2, "size"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/beyond/sui/SUIText;->size:I

    .line 88
    const-string v2, "flick"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 89
    .local v1, "str":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 90
    const-string v2, "YES"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 91
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/beyond/sui/SUIText;->isFlick:Z

    .line 94
    :cond_0
    const-string v2, "string"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "s":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 96
    iput-object v0, p0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    .line 97
    :cond_1
    return-void
.end method

.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 6
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    .line 64
    const-string v4, "string"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    .line 67
    const-string v4, "swip"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/sui/SUIText;->swip_str:Ljava/lang/String;

    .line 68
    const-string v4, "font"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "font_str":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 70
    sget-object v4, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-static {v4, v2}, Lcom/beyond/sui/SUIFont;->load(Landroid/content/Context;Ljava/lang/String;)Lcom/beyond/sui/SUIFont;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/sui/SUIText;->suiFont:Lcom/beyond/sui/SUIFont;

    .line 72
    :cond_0
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v3

    .line 73
    .local v3, "v":Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-nez v4, :cond_2

    .line 82
    const/4 v4, 0x1

    return v4

    .line 74
    :cond_2
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnanoxml/XMLElement;

    .line 75
    .local v0, "el":Lnanoxml/XMLElement;
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "attr"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 76
    invoke-virtual {p0, v0}, Lcom/beyond/sui/SUIText;->makeAttr(Lnanoxml/XMLElement;)V

    goto :goto_0

    .line 78
    :cond_3
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "color"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 79
    invoke-virtual {p0, v0}, Lcom/beyond/sui/SUIText;->getColor(Lnanoxml/XMLElement;)I

    move-result v4

    iput v4, p0, Lcom/beyond/sui/SUIText;->color:I

    goto :goto_0
.end method

.method protected mouseEvnet(ILandroid/view/MotionEvent;Landroid/graphics/Rect;Landroid/view/View;)I
    .locals 9
    .param p1, "event"    # I
    .param p2, "arg0"    # Landroid/view/MotionEvent;
    .param p3, "rc"    # Landroid/graphics/Rect;
    .param p4, "jc"    # Landroid/view/View;

    .prologue
    const/16 v8, 0xb

    const/4 v7, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 101
    iget-boolean v4, p0, Lcom/beyond/sui/SUIText;->isSwipShow:Z

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    if-eqz v4, :cond_4

    .line 102
    iget-object v4, p0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    invoke-virtual {v4, p2, p3, p1, p4}, Lcom/beyond/sui/SUIView;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v0

    .line 103
    .local v0, "ret":I
    if-ne v0, v2, :cond_2

    if-ne p1, v7, :cond_2

    .line 104
    iget-object v4, p0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    const/16 v5, 0xa

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Lcom/beyond/sui/SUIView;->getValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 105
    .local v1, "rstr":Ljava/lang/String;
    if-eqz v1, :cond_1

    const-string v4, "swip_ok"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 106
    iput-boolean v3, p0, Lcom/beyond/sui/SUIText;->isSwipShow:Z

    .line 107
    iget-object v3, p0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    const-string v4, ""

    invoke-virtual {v3, v8, v4}, Lcom/beyond/sui/SUIView;->getValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    move v0, v2

    .line 142
    .end local v0    # "ret":I
    .end local v1    # "rstr":Ljava/lang/String;
    :cond_0
    :goto_0
    return v0

    .line 110
    .restart local v0    # "ret":I
    .restart local v1    # "rstr":Ljava/lang/String;
    :cond_1
    if-eqz v1, :cond_2

    const-string v4, "swip_cancel"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 111
    iput-boolean v3, p0, Lcom/beyond/sui/SUIText;->isSwipShow:Z

    move v0, v2

    .line 112
    goto :goto_0

    .line 115
    .end local v1    # "rstr":Ljava/lang/String;
    :cond_2
    if-eq v0, v2, :cond_0

    .end local v0    # "ret":I
    :cond_3
    move v0, v3

    .line 142
    goto :goto_0

    .line 119
    :cond_4
    iget-object v4, p0, Lcom/beyond/sui/SUIText;->rect:Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Rect;->contains(II)Z

    move-result v4

    if-nez v4, :cond_5

    move v0, v3

    .line 120
    goto :goto_0

    .line 123
    :cond_5
    if-ne p1, v7, :cond_3

    .line 124
    iget-object v4, p0, Lcom/beyond/sui/SUIText;->swip_str:Ljava/lang/String;

    if-eqz v4, :cond_3

    .line 125
    new-instance v4, Lcom/beyond/sui/SUIView;

    invoke-direct {v4}, Lcom/beyond/sui/SUIView;-><init>()V

    iput-object v4, p0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    .line 126
    iget-object v4, p0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    iget-object v5, p0, Lcom/beyond/sui/SUIText;->swip_str:Ljava/lang/String;

    iput-object v5, v4, Lcom/beyond/sui/SUIView;->xmlPath:Ljava/lang/String;

    .line 127
    iget-object v4, p0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    sget-object v5, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    iget-object v6, p0, Lcom/beyond/sui/SUIText;->swip_str:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lcom/beyond/sui/SUIView;->loadXml(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 128
    iput-boolean v2, p0, Lcom/beyond/sui/SUIText;->isSwipShow:Z

    .line 129
    iget-object v3, p0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    if-eqz v3, :cond_6

    .line 130
    iget-object v3, p0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    const-string v4, ""

    iget-object v5, p0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    invoke-virtual {v3, v8, v4, v5}, Lcom/beyond/sui/SUIView;->setValue(ILjava/lang/String;Ljava/lang/String;)Z

    :cond_6
    move v0, v2

    .line 132
    goto :goto_0

    .line 135
    :cond_7
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    .line 136
    iput-boolean v3, p0, Lcom/beyond/sui/SUIText;->isSwipShow:Z

    move v0, v3

    .line 137
    goto :goto_0
.end method

.method protected onSetValue(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "componentType"    # I
    .param p2, "n"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 148
    const/4 v2, 0x5

    if-ne p1, v2, :cond_0

    .line 149
    iget-object v2, p0, Lcom/beyond/sui/SUIText;->name:Ljava/lang/String;

    if-eqz v2, :cond_5

    .line 150
    iget-object v2, p0, Lcom/beyond/sui/SUIText;->name:Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_5

    .line 151
    invoke-virtual {p0, p3}, Lcom/beyond/sui/SUIText;->setText(Ljava/lang/String;)V

    .line 184
    :goto_0
    return v0

    .line 156
    :cond_0
    const/4 v2, 0x7

    if-ne p1, v2, :cond_1

    .line 157
    iget-object v2, p0, Lcom/beyond/sui/SUIText;->name:Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_5

    .line 158
    invoke-virtual {p0, p3}, Lcom/beyond/sui/SUIText;->setText(Ljava/lang/String;)V

    goto :goto_0

    .line 162
    :cond_1
    const/4 v2, 0x3

    if-ne p1, v2, :cond_5

    .line 163
    const-string v2, "show"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 164
    if-nez p2, :cond_2

    .line 165
    invoke-virtual {p0, v0}, Lcom/beyond/sui/SUIText;->setVisible(Z)V

    goto :goto_0

    .line 168
    :cond_2
    iget-object v2, p0, Lcom/beyond/sui/SUIText;->name:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 169
    invoke-virtual {p0, v0}, Lcom/beyond/sui/SUIText;->setVisible(Z)V

    goto :goto_0

    .line 173
    :cond_3
    const-string v2, "hide"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 174
    if-nez p2, :cond_4

    .line 175
    invoke-virtual {p0, v1}, Lcom/beyond/sui/SUIText;->setVisible(Z)V

    goto :goto_0

    .line 178
    :cond_4
    iget-object v2, p0, Lcom/beyond/sui/SUIText;->name:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 179
    invoke-virtual {p0, v1}, Lcom/beyond/sui/SUIText;->setVisible(Z)V

    goto :goto_0

    :cond_5
    move v0, v1

    .line 184
    goto :goto_0
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 16
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint0"    # Landroid/graphics/Paint;

    .prologue
    .line 31
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/beyond/sui/SUIText;->isSwipShow:Z

    if-eqz v3, :cond_1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    if-eqz v3, :cond_1

    .line 32
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIText;->swipView:Lcom/beyond/sui/SUIView;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v3, v0, v1, v2}, Lcom/beyond/sui/SUIView;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 61
    :cond_0
    :goto_0
    return-void

    .line 36
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 37
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIText;->suiFont:Lcom/beyond/sui/SUIFont;

    if-eqz v3, :cond_2

    .line 38
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIText;->suiFont:Lcom/beyond/sui/SUIFont;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    move-object/from16 v0, p2

    iget v6, v0, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p2

    iget v7, v0, Landroid/graphics/Rect;->top:I

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget v9, v0, Lcom/beyond/sui/SUIText;->size:I

    move-object/from16 v4, p1

    move-object/from16 v10, p3

    invoke-virtual/range {v3 .. v10}, Lcom/beyond/sui/SUIFont;->drawString(Landroid/graphics/Canvas;Ljava/lang/String;IIIILandroid/graphics/Paint;)V

    goto :goto_0

    .line 41
    :cond_2
    new-instance v12, Landroid/text/TextPaint;

    invoke-direct {v12}, Landroid/text/TextPaint;-><init>()V

    .line 42
    .local v12, "paint":Landroid/text/TextPaint;
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v13

    .line 43
    .local v13, "tf":Landroid/graphics/Typeface;
    move-object/from16 v0, p0

    iget v3, v0, Lcom/beyond/sui/SUIText;->size:I

    int-to-float v3, v3

    invoke-virtual {v12, v3}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 44
    invoke-virtual {v12, v13}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 48
    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    .line 49
    .local v11, "bounds":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v12, v3, v4, v5, v11}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 53
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    invoke-virtual {v11}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    sub-int v14, v3, v4

    .line 54
    .local v14, "x":I
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    invoke-virtual {v11}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    add-int v15, v3, v4

    .line 59
    .local v15, "y":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    int-to-float v4, v14

    int-to-float v5, v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4, v5, v12}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method protected setText(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 188
    iput-object p1, p0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    .line 189
    return-void
.end method
