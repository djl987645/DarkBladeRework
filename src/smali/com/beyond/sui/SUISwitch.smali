.class Lcom/beyond/sui/SUISwitch;
.super Lcom/beyond/sui/SUIBase;
.source "SUISwitch.java"


# instance fields
.field private buttonMoving:Lcom/beyond/sui/SUIButton;

.field private buttonOff:Lcom/beyond/sui/SUIButton;

.field private buttonOn:Lcom/beyond/sui/SUIButton;

.field private buttonTemp:Lcom/beyond/sui/SUIButton;

.field private isMoving:Z

.field private oldx:I

.field private rcOff:Landroid/graphics/Rect;

.field private rcOn:Landroid/graphics/Rect;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 16
    iput-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    .line 17
    iput-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    .line 19
    iput-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonMoving:Lcom/beyond/sui/SUIButton;

    .line 20
    new-instance v0, Lcom/beyond/sui/SUIButton;

    invoke-direct {v0}, Lcom/beyond/sui/SUIButton;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonTemp:Lcom/beyond/sui/SUIButton;

    .line 22
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUISwitch;->rcOff:Landroid/graphics/Rect;

    .line 23
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUISwitch;->rcOn:Landroid/graphics/Rect;

    .line 25
    iput v1, p0, Lcom/beyond/sui/SUISwitch;->oldx:I

    .line 26
    iput-boolean v1, p0, Lcom/beyond/sui/SUISwitch;->isMoving:Z

    .line 15
    return-void
.end method

.method private getContainBtn(II)Lcom/beyond/sui/SUIButton;
    .locals 1
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 154
    iget-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v0, p1, p2}, Lcom/beyond/sui/SUIButton;->contains(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    .line 163
    :goto_0
    return-object v0

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    if-eqz v0, :cond_1

    .line 160
    iget-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v0, p1, p2}, Lcom/beyond/sui/SUIButton;->contains(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 161
    iget-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    goto :goto_0

    .line 163
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 10
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    const/4 v9, 0x0

    .line 39
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v3

    .line 40
    .local v3, "v":Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-nez v4, :cond_1

    .line 59
    const/4 v4, 0x1

    return v4

    .line 41
    :cond_1
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnanoxml/XMLElement;

    .line 42
    .local v1, "el":Lnanoxml/XMLElement;
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "buttonOn"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 43
    new-instance v0, Lcom/beyond/sui/SUIButton;

    invoke-direct {v0}, Lcom/beyond/sui/SUIButton;-><init>()V

    .line 44
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    iput-boolean v9, v0, Lcom/beyond/sui/SUIButton;->isSendEvent:Z

    .line 45
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIButton;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 46
    iput-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    .line 47
    new-instance v4, Landroid/graphics/Rect;

    iget-object v5, v0, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget-object v6, v0, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    iget-object v7, v0, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    iget-object v8, v0, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    invoke-direct {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v4, p0, Lcom/beyond/sui/SUISwitch;->rcOn:Landroid/graphics/Rect;

    goto :goto_0

    .line 50
    .end local v0    # "c":Lcom/beyond/sui/SUIButton;
    :cond_2
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "buttonOff"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 51
    new-instance v0, Lcom/beyond/sui/SUIButton;

    invoke-direct {v0}, Lcom/beyond/sui/SUIButton;-><init>()V

    .line 52
    .restart local v0    # "c":Lcom/beyond/sui/SUIButton;
    iput-boolean v9, v0, Lcom/beyond/sui/SUIButton;->isSendEvent:Z

    .line 53
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIButton;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 54
    iput-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    .line 55
    new-instance v4, Landroid/graphics/Rect;

    iget-object v5, v0, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget-object v6, v0, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    iget-object v7, v0, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    iget-object v8, v0, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    invoke-direct {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v4, p0, Lcom/beyond/sui/SUISwitch;->rcOff:Landroid/graphics/Rect;

    goto :goto_0
.end method

.method protected mouseEvnet(ILandroid/view/MotionEvent;Landroid/graphics/Rect;Landroid/view/View;)I
    .locals 9
    .param p1, "event"    # I
    .param p2, "arg0"    # Landroid/view/MotionEvent;
    .param p3, "rc"    # Landroid/graphics/Rect;
    .param p4, "jc"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    const/4 v8, 0x2

    const/4 v3, 0x1

    .line 63
    const/4 v2, 0x0

    .line 64
    .local v2, "ret":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    float-to-int v6, v6

    invoke-direct {p0, v5, v6}, Lcom/beyond/sui/SUISwitch;->getContainBtn(II)Lcom/beyond/sui/SUIButton;

    move-result-object v0

    .line 66
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    iget-boolean v5, p0, Lcom/beyond/sui/SUISwitch;->isMoving:Z

    if-eqz v5, :cond_3

    .line 67
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    if-ne v0, v5, :cond_1

    .line 68
    const/4 v5, 0x5

    if-ne p1, v5, :cond_0

    .line 69
    iget v5, p0, Lcom/beyond/sui/SUISwitch;->oldx:I

    int-to-float v5, v5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    sub-float/2addr v5, v6

    float-to-int v1, v5

    .line 70
    .local v1, "diff":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v5, v5

    iput v5, p0, Lcom/beyond/sui/SUISwitch;->oldx:I

    .line 72
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iget-object v5, v5, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    neg-int v6, v1

    invoke-virtual {v5, v6, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 150
    .end local v1    # "diff":I
    :goto_0
    return v3

    .line 75
    :cond_0
    if-ne p1, v8, :cond_8

    .line 76
    iput-boolean v4, p0, Lcom/beyond/sui/SUISwitch;->isMoving:Z

    .line 77
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iput v8, v5, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 79
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iget-object v5, v5, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/beyond/sui/SUISwitch;->rcOff:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    iget-object v7, p0, Lcom/beyond/sui/SUISwitch;->rcOff:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 80
    iput v4, p0, Lcom/beyond/sui/SUISwitch;->oldx:I

    goto :goto_0

    .line 84
    :cond_1
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    if-ne v0, v5, :cond_2

    .line 85
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iput-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonTemp:Lcom/beyond/sui/SUIButton;

    .line 86
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iput-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    .line 87
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonTemp:Lcom/beyond/sui/SUIButton;

    iput-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    .line 89
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iget-object v5, v5, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/beyond/sui/SUISwitch;->rcOff:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    iget-object v7, p0, Lcom/beyond/sui/SUISwitch;->rcOff:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 90
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iget-object v5, v5, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/beyond/sui/SUISwitch;->rcOn:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    iget-object v7, p0, Lcom/beyond/sui/SUISwitch;->rcOn:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 92
    iput-boolean v4, p0, Lcom/beyond/sui/SUISwitch;->isMoving:Z

    .line 93
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iput v8, v5, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 94
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iput v8, v5, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 96
    iput v4, p0, Lcom/beyond/sui/SUISwitch;->oldx:I

    goto :goto_0

    .line 102
    :cond_2
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iget-object v5, v5, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/beyond/sui/SUISwitch;->rcOff:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    iget-object v7, p0, Lcom/beyond/sui/SUISwitch;->rcOff:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 103
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iget-object v5, v5, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/beyond/sui/SUISwitch;->rcOn:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    iget-object v7, p0, Lcom/beyond/sui/SUISwitch;->rcOn:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 104
    iput-boolean v4, p0, Lcom/beyond/sui/SUISwitch;->isMoving:Z

    .line 105
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iput v8, v5, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 106
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iput v8, v5, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 107
    iput v4, p0, Lcom/beyond/sui/SUISwitch;->oldx:I

    goto :goto_0

    .line 112
    :cond_3
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    if-ne v0, v5, :cond_5

    .line 113
    if-ne p1, v3, :cond_4

    .line 114
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iget v5, v5, Lcom/beyond/sui/SUIButton;->state_press:I

    if-ne v5, v8, :cond_8

    .line 115
    iget-object v4, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iput v3, v4, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 116
    iget-object v4, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iget v4, v4, Lcom/beyond/sui/SUIButton;->key_code:I

    invoke-static {v3, v4}, Lcom/beyond/sui/SUImanager;->sendWipiKeyEvent(II)V

    goto/16 :goto_0

    .line 120
    :cond_4
    if-ne p1, v8, :cond_8

    .line 121
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iget v5, v5, Lcom/beyond/sui/SUIButton;->state_press:I

    if-ne v5, v3, :cond_8

    .line 122
    iget-object v4, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iput v8, v4, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 123
    iget-object v4, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iget v4, v4, Lcom/beyond/sui/SUIButton;->key_code:I

    invoke-static {v8, v4}, Lcom/beyond/sui/SUImanager;->sendWipiKeyEvent(II)V

    goto/16 :goto_0

    .line 128
    :cond_5
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    if-ne v0, v5, :cond_7

    .line 129
    if-ne p1, v3, :cond_6

    .line 130
    iput-boolean v3, p0, Lcom/beyond/sui/SUISwitch;->isMoving:Z

    .line 131
    iget-object v4, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iput v3, v4, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 132
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    float-to-int v4, v4

    iput v4, p0, Lcom/beyond/sui/SUISwitch;->oldx:I

    goto/16 :goto_0

    .line 135
    :cond_6
    if-ne p1, v8, :cond_8

    .line 136
    iget-object v5, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iget v5, v5, Lcom/beyond/sui/SUIButton;->state_press:I

    if-ne v5, v3, :cond_8

    .line 137
    iget-object v4, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iput v8, v4, Lcom/beyond/sui/SUIButton;->state_press:I

    goto/16 :goto_0

    .line 143
    :cond_7
    iget-object v3, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iput v8, v3, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 144
    iget-object v3, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iput v8, v3, Lcom/beyond/sui/SUIButton;->state_press:I

    move v3, v4

    .line 145
    goto/16 :goto_0

    :cond_8
    move v3, v4

    .line 150
    goto/16 :goto_0
.end method

.method protected onGetValue(ILjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "n"    # Ljava/lang/String;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iget v0, v0, Lcom/beyond/sui/SUIButton;->key_code:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onSetValue(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 8
    .param p1, "componentType"    # I
    .param p2, "n"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    const/16 v4, 0x9

    const/4 v6, 0x2

    const/4 v5, 0x0

    .line 171
    const-string v2, "0"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 172
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iget v1, v2, Lcom/beyond/sui/SUIButton;->alpha:I

    .line 173
    .local v1, "alphaOn":I
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iget v0, v2, Lcom/beyond/sui/SUIButton;->alpha:I

    .line 174
    .local v0, "alphaOff":I
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iput-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonTemp:Lcom/beyond/sui/SUIButton;

    .line 175
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iput-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    .line 176
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonTemp:Lcom/beyond/sui/SUIButton;

    iput-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    .line 177
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iget-object v2, v2, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/beyond/sui/SUISwitch;->rcOff:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    iget-object v4, p0, Lcom/beyond/sui/SUISwitch;->rcOff:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 178
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iget-object v2, v2, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/beyond/sui/SUISwitch;->rcOn:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    iget-object v4, p0, Lcom/beyond/sui/SUISwitch;->rcOn:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 179
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iput v1, v2, Lcom/beyond/sui/SUIButton;->alpha:I

    .line 180
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iput v0, v2, Lcom/beyond/sui/SUIButton;->alpha:I

    .line 182
    iput-boolean v5, p0, Lcom/beyond/sui/SUISwitch;->isMoving:Z

    .line 183
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    iput v6, v2, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 184
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    iput v6, v2, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 186
    iput v5, p0, Lcom/beyond/sui/SUISwitch;->oldx:I

    .line 194
    .end local v0    # "alphaOff":I
    .end local v1    # "alphaOn":I
    :cond_0
    :goto_0
    const/4 v2, 0x1

    return v2

    .line 188
    :cond_1
    const-string v2, "offhide"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 189
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    const-string v3, "hide"

    invoke-virtual {v2, v4, v7, v3}, Lcom/beyond/sui/SUIButton;->setValue(ILjava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 191
    :cond_2
    const-string v2, "offshow"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 192
    iget-object v2, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    const-string v3, "show"

    invoke-virtual {v2, v4, v7, v3}, Lcom/beyond/sui/SUIButton;->setValue(ILjava/lang/String;Ljava/lang/String;)Z

    goto :goto_0
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 1
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    if-eqz v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOn:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    if-eqz v0, :cond_1

    .line 35
    iget-object v0, p0, Lcom/beyond/sui/SUISwitch;->buttonOff:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 36
    :cond_1
    return-void
.end method
