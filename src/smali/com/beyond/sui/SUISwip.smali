.class Lcom/beyond/sui/SUISwip;
.super Lcom/beyond/sui/SUIBase;
.source "SUISwip.java"


# instance fields
.field button_cancel:Lcom/beyond/sui/SUIButton;

.field button_ok:Lcom/beyond/sui/SUIButton;

.field private cur_pad:Lcom/beyond/sui/SUIKeypad;

.field private pads:[Lcom/beyond/sui/SUIKeypad;

.field text:Lcom/beyond/sui/SUIText;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 16
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 18
    iput-object v0, p0, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    .line 19
    iput-object v0, p0, Lcom/beyond/sui/SUISwip;->button_ok:Lcom/beyond/sui/SUIButton;

    .line 20
    iput-object v0, p0, Lcom/beyond/sui/SUISwip;->button_cancel:Lcom/beyond/sui/SUIButton;

    .line 22
    iput-object v0, p0, Lcom/beyond/sui/SUISwip;->pads:[Lcom/beyond/sui/SUIKeypad;

    .line 23
    iput-object v0, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    .line 16
    return-void
.end method

.method private findPad(Ljava/lang/String;)Lcom/beyond/sui/SUIKeypad;
    .locals 2
    .param p1, "swip_pad_name"    # Ljava/lang/String;

    .prologue
    .line 130
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/beyond/sui/SUISwip;->pads:[Lcom/beyond/sui/SUIKeypad;

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 134
    const/4 v1, 0x0

    :goto_1
    return-object v1

    .line 131
    :cond_0
    iget-object v1, p0, Lcom/beyond/sui/SUISwip;->pads:[Lcom/beyond/sui/SUIKeypad;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/beyond/sui/SUIKeypad;->name:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 132
    iget-object v1, p0, Lcom/beyond/sui/SUISwip;->pads:[Lcom/beyond/sui/SUIKeypad;

    aget-object v1, v1, v0

    goto :goto_1

    .line 130
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected getValueStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "n"    # Ljava/lang/String;

    .prologue
    .line 173
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    invoke-virtual {v0, p1}, Lcom/beyond/sui/SUIKeypad;->getValueStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 9
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    const/4 v8, 0x0

    .line 40
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v5

    .line 41
    .local v5, "v":Ljava/util/Vector;
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 42
    .local v4, "pad":Ljava/util/Vector;
    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-nez v6, :cond_2

    .line 70
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v6

    if-lez v6, :cond_1

    .line 71
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v6

    new-array v6, v6, [Lcom/beyond/sui/SUIKeypad;

    iput-object v6, p0, Lcom/beyond/sui/SUISwip;->pads:[Lcom/beyond/sui/SUIKeypad;

    .line 72
    :cond_1
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    iget-object v6, p0, Lcom/beyond/sui/SUISwip;->pads:[Lcom/beyond/sui/SUIKeypad;

    array-length v6, v6

    if-lt v3, v6, :cond_6

    .line 75
    iget-object v6, p0, Lcom/beyond/sui/SUISwip;->pads:[Lcom/beyond/sui/SUIKeypad;

    aget-object v6, v6, v8

    iput-object v6, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    .line 77
    invoke-static {}, Lcom/beyond/sui/AutomataX;->getInst()Lcom/beyond/sui/AutomataX;

    move-result-object v6

    invoke-virtual {v6}, Lcom/beyond/sui/AutomataX;->init()V

    .line 78
    invoke-static {}, Lcom/beyond/sui/AutomataX;->getInst()Lcom/beyond/sui/AutomataX;

    move-result-object v6

    const/16 v7, 0x20

    iput v7, v6, Lcom/beyond/sui/AutomataX;->inputMode:I

    .line 80
    const/4 v6, 0x1

    return v6

    .line 43
    .end local v3    # "i":I
    :cond_2
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnanoxml/XMLElement;

    .line 44
    .local v1, "el":Lnanoxml/XMLElement;
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "keypad"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 45
    new-instance v0, Lcom/beyond/sui/SUIKeypad;

    invoke-direct {v0}, Lcom/beyond/sui/SUIKeypad;-><init>()V

    .line 46
    .local v0, "c":Lcom/beyond/sui/SUIKeypad;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIKeypad;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 47
    invoke-virtual {v4, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 49
    .end local v0    # "c":Lcom/beyond/sui/SUIKeypad;
    :cond_3
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "text"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 50
    new-instance v0, Lcom/beyond/sui/SUIText;

    invoke-direct {v0}, Lcom/beyond/sui/SUIText;-><init>()V

    .line 51
    .local v0, "c":Lcom/beyond/sui/SUIText;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIText;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 52
    iput-object v0, p0, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    goto :goto_0

    .line 54
    .end local v0    # "c":Lcom/beyond/sui/SUIText;
    :cond_4
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "button_ok"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 55
    new-instance v0, Lcom/beyond/sui/SUIButton;

    invoke-direct {v0}, Lcom/beyond/sui/SUIButton;-><init>()V

    .line 56
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIButton;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 57
    iput-boolean v8, v0, Lcom/beyond/sui/SUIButton;->isSendEvent:Z

    .line 58
    iput-object v0, p0, Lcom/beyond/sui/SUISwip;->button_ok:Lcom/beyond/sui/SUIButton;

    goto/16 :goto_0

    .line 61
    .end local v0    # "c":Lcom/beyond/sui/SUIButton;
    :cond_5
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "button_cancel"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 62
    new-instance v0, Lcom/beyond/sui/SUIButton;

    invoke-direct {v0}, Lcom/beyond/sui/SUIButton;-><init>()V

    .line 63
    .restart local v0    # "c":Lcom/beyond/sui/SUIButton;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIButton;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 64
    iput-boolean v8, v0, Lcom/beyond/sui/SUIButton;->isSendEvent:Z

    .line 65
    iput-object v0, p0, Lcom/beyond/sui/SUISwip;->button_cancel:Lcom/beyond/sui/SUIButton;

    goto/16 :goto_0

    .line 73
    .end local v0    # "c":Lcom/beyond/sui/SUIButton;
    .end local v1    # "el":Lnanoxml/XMLElement;
    .restart local v3    # "i":I
    :cond_6
    iget-object v7, p0, Lcom/beyond/sui/SUISwip;->pads:[Lcom/beyond/sui/SUIKeypad;

    invoke-virtual {v4, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/beyond/sui/SUIKeypad;

    aput-object v6, v7, v3

    .line 72
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1
.end method

.method protected mouseEvnet(ILandroid/view/MotionEvent;Landroid/graphics/Rect;Landroid/view/View;)I
    .locals 7
    .param p1, "event"    # I
    .param p2, "arg0"    # Landroid/view/MotionEvent;
    .param p3, "rc"    # Landroid/graphics/Rect;
    .param p4, "jc"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x2

    .line 85
    const/4 v2, 0x0

    .line 87
    .local v2, "ret":I
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    invoke-virtual {v4, p2, p3, p1, p4}, Lcom/beyond/sui/SUIKeypad;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    if-eqz v2, :cond_3

    .line 88
    if-ne p1, v5, :cond_2

    .line 89
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    if-eqz v4, :cond_1

    .line 90
    invoke-static {}, Lcom/beyond/sui/AutomataX;->getInst()Lcom/beyond/sui/AutomataX;

    move-result-object v4

    invoke-virtual {v4}, Lcom/beyond/sui/AutomataX;->getComposedString()Ljava/lang/String;

    move-result-object v3

    .line 91
    .local v3, "str":Ljava/lang/String;
    new-array v0, v6, [C

    .line 92
    .local v0, "cc":[C
    invoke-static {}, Lcom/beyond/sui/AutomataX;->getInst()Lcom/beyond/sui/AutomataX;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/beyond/sui/AutomataX;->getComposingChar([C)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 93
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 95
    :cond_0
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    invoke-virtual {v4, v3}, Lcom/beyond/sui/SUIText;->setText(Ljava/lang/String;)V

    .end local v0    # "cc":[C
    .end local v3    # "str":Ljava/lang/String;
    :cond_1
    :goto_0
    move v4, v2

    .line 126
    :goto_1
    return v4

    .line 98
    :cond_2
    if-ne p1, v6, :cond_1

    .line 99
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    iget-object v4, v4, Lcom/beyond/sui/SUIKeypad;->pressed_btn:Lcom/beyond/sui/SUIKeypadButton;

    if-eqz v4, :cond_1

    .line 100
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    iget-object v4, v4, Lcom/beyond/sui/SUIKeypad;->pressed_btn:Lcom/beyond/sui/SUIKeypadButton;

    iget-object v4, v4, Lcom/beyond/sui/SUIKeypadButton;->swip_pad_name:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 101
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    iget-object v4, v4, Lcom/beyond/sui/SUIKeypad;->pressed_btn:Lcom/beyond/sui/SUIKeypadButton;

    iget-object v4, v4, Lcom/beyond/sui/SUIKeypadButton;->swip_pad_name:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/beyond/sui/SUISwip;->findPad(Ljava/lang/String;)Lcom/beyond/sui/SUIKeypad;

    move-result-object v1

    .line 102
    .local v1, "pad":Lcom/beyond/sui/SUIKeypad;
    if-eqz v1, :cond_1

    .line 103
    iput-object v1, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    goto :goto_0

    .line 110
    .end local v1    # "pad":Lcom/beyond/sui/SUIKeypad;
    :cond_3
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->button_ok:Lcom/beyond/sui/SUIButton;

    if-eqz v4, :cond_5

    .line 111
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->button_ok:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v4, p2, p3, p1, p4}, Lcom/beyond/sui/SUIButton;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    if-eqz v2, :cond_5

    .line 112
    if-ne p1, v5, :cond_4

    .line 113
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    const-string v5, "swip_ok"

    iput-object v5, v4, Lcom/beyond/sui/SUIKeypad;->value:Ljava/lang/String;

    :cond_4
    move v4, v2

    .line 115
    goto :goto_1

    .line 118
    :cond_5
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->button_cancel:Lcom/beyond/sui/SUIButton;

    if-eqz v4, :cond_7

    .line 119
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->button_cancel:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v4, p2, p3, p1, p4}, Lcom/beyond/sui/SUIButton;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    if-eqz v2, :cond_7

    .line 120
    if-ne p1, v5, :cond_6

    .line 121
    iget-object v4, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    const-string v5, "swip_cancel"

    iput-object v5, v4, Lcom/beyond/sui/SUIKeypad;->value:Ljava/lang/String;

    :cond_6
    move v4, v2

    .line 123
    goto :goto_1

    .line 126
    :cond_7
    const/4 v4, 0x0

    goto :goto_1
.end method

.method protected onGetValue(ILjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "n"    # Ljava/lang/String;

    .prologue
    .line 163
    const/16 v0, 0xa

    if-ne p1, v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    iget-object v0, v0, Lcom/beyond/sui/SUIKeypad;->value:Ljava/lang/String;

    .line 169
    :goto_0
    return-object v0

    .line 166
    :cond_0
    const/16 v0, 0xb

    if-ne p1, v0, :cond_1

    .line 167
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    iget-object v0, v0, Lcom/beyond/sui/SUIText;->str:Ljava/lang/String;

    goto :goto_0

    .line 169
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onSetValue(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    .line 149
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 150
    invoke-virtual {p0, p2, p3}, Lcom/beyond/sui/SUISwip;->setValueStr(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 159
    :goto_0
    return v0

    .line 151
    :cond_0
    const/4 v0, 0x7

    if-ne p1, v0, :cond_1

    .line 152
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    if-eqz v0, :cond_1

    .line 153
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    iget-object v0, v0, Lcom/beyond/sui/SUIText;->name:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 154
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    invoke-virtual {v0, p3}, Lcom/beyond/sui/SUIText;->setText(Ljava/lang/String;)V

    .line 159
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 1
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->cur_pad:Lcom/beyond/sui/SUIKeypad;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIKeypad;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 28
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    if-eqz v0, :cond_0

    .line 29
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIText;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->button_ok:Lcom/beyond/sui/SUIButton;

    if-eqz v0, :cond_1

    .line 32
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->button_ok:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 34
    :cond_1
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->button_cancel:Lcom/beyond/sui/SUIButton;

    if-eqz v0, :cond_2

    .line 35
    iget-object v0, p0, Lcom/beyond/sui/SUISwip;->button_cancel:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 37
    :cond_2
    return-void
.end method
