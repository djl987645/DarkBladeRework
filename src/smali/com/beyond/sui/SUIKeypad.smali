.class Lcom/beyond/sui/SUIKeypad;
.super Lcom/beyond/sui/SUIBase;
.source "SUIKeypad.java"


# static fields
.field static final KPT_ENGLISH_LARGE:I = 0x1

.field static final KPT_ENGLISH_SMALL:I = 0x0

.field static final KPT_KOREAN_1:I = 0x2


# instance fields
.field private btns:[Lcom/beyond/sui/SUIKeypadButton;

.field private image_pressed:Landroid/graphics/Bitmap;

.field private image_released:Landroid/graphics/Bitmap;

.field pressed_btn:Lcom/beyond/sui/SUIKeypadButton;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 19
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 24
    iput-object v0, p0, Lcom/beyond/sui/SUIKeypad;->image_released:Landroid/graphics/Bitmap;

    .line 25
    iput-object v0, p0, Lcom/beyond/sui/SUIKeypad;->image_pressed:Landroid/graphics/Bitmap;

    .line 26
    iput-object v0, p0, Lcom/beyond/sui/SUIKeypad;->btns:[Lcom/beyond/sui/SUIKeypadButton;

    .line 28
    iput-object v0, p0, Lcom/beyond/sui/SUIKeypad;->pressed_btn:Lcom/beyond/sui/SUIKeypadButton;

    .line 19
    return-void
.end method

.method private getContainBtn(II)Lcom/beyond/sui/SUIKeypadButton;
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 100
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/beyond/sui/SUIKeypad;->btns:[Lcom/beyond/sui/SUIKeypadButton;

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 104
    const/4 v1, 0x0

    :goto_1
    return-object v1

    .line 101
    :cond_0
    iget-object v1, p0, Lcom/beyond/sui/SUIKeypad;->btns:[Lcom/beyond/sui/SUIKeypadButton;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1, p2}, Lcom/beyond/sui/SUIKeypadButton;->contains(II)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 102
    iget-object v1, p0, Lcom/beyond/sui/SUIKeypad;->btns:[Lcom/beyond/sui/SUIKeypadButton;

    aget-object v1, v1, v0

    goto :goto_1

    .line 100
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected getValueStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "n"    # Ljava/lang/String;

    .prologue
    .line 108
    iget-object v0, p0, Lcom/beyond/sui/SUIKeypad;->value:Ljava/lang/String;

    return-object v0
.end method

.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 8
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    .line 41
    const-string v6, "released_image"

    invoke-virtual {p1, v6}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/beyond/sui/SUIKeypad;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v6

    iput-object v6, p0, Lcom/beyond/sui/SUIKeypad;->image_released:Landroid/graphics/Bitmap;

    .line 42
    const-string v6, "pressed_image"

    invoke-virtual {p1, v6}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/beyond/sui/SUIKeypad;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v6

    iput-object v6, p0, Lcom/beyond/sui/SUIKeypad;->image_pressed:Landroid/graphics/Bitmap;

    .line 44
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v5

    .line 45
    .local v5, "v":Ljava/util/Vector;
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 46
    .local v0, "bs":Ljava/util/Vector;
    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-nez v6, :cond_2

    .line 57
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v6

    if-lez v6, :cond_1

    .line 58
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v6

    new-array v6, v6, [Lcom/beyond/sui/SUIKeypadButton;

    iput-object v6, p0, Lcom/beyond/sui/SUIKeypad;->btns:[Lcom/beyond/sui/SUIKeypadButton;

    .line 59
    :cond_1
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    iget-object v6, p0, Lcom/beyond/sui/SUIKeypad;->btns:[Lcom/beyond/sui/SUIKeypadButton;

    array-length v6, v6

    if-lt v4, v6, :cond_3

    .line 67
    const/4 v6, 0x1

    return v6

    .line 47
    .end local v4    # "i":I
    :cond_2
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnanoxml/XMLElement;

    .line 48
    .local v2, "el":Lnanoxml/XMLElement;
    invoke-virtual {v2}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "key_button"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 49
    new-instance v1, Lcom/beyond/sui/SUIKeypadButton;

    invoke-direct {v1}, Lcom/beyond/sui/SUIKeypadButton;-><init>()V

    .line 50
    .local v1, "c":Lcom/beyond/sui/SUIKeypadButton;
    invoke-virtual {v1, v2, p0}, Lcom/beyond/sui/SUIKeypadButton;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 51
    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 52
    iget-object v6, p0, Lcom/beyond/sui/SUIKeypad;->image_pressed:Landroid/graphics/Bitmap;

    iput-object v6, v1, Lcom/beyond/sui/SUIKeypadButton;->image_pressed:Landroid/graphics/Bitmap;

    goto :goto_0

    .line 60
    .end local v1    # "c":Lcom/beyond/sui/SUIKeypadButton;
    .end local v2    # "el":Lnanoxml/XMLElement;
    .restart local v4    # "i":I
    :cond_3
    iget-object v7, p0, Lcom/beyond/sui/SUIKeypad;->btns:[Lcom/beyond/sui/SUIKeypadButton;

    invoke-virtual {v0, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/beyond/sui/SUIKeypadButton;

    aput-object v6, v7, v4

    .line 59
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method protected mouseEvnet(ILandroid/view/MotionEvent;Landroid/graphics/Rect;Landroid/view/View;)I
    .locals 5
    .param p1, "event"    # I
    .param p2, "arg0"    # Landroid/view/MotionEvent;
    .param p3, "rc"    # Landroid/graphics/Rect;
    .param p4, "jc"    # Landroid/view/View;

    .prologue
    .line 71
    const/4 v2, 0x0

    .line 72
    .local v2, "ret":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    invoke-direct {p0, v3, v4}, Lcom/beyond/sui/SUIKeypad;->getContainBtn(II)Lcom/beyond/sui/SUIKeypadButton;

    move-result-object v0

    .line 73
    .local v0, "c":Lcom/beyond/sui/SUIKeypadButton;
    const/4 v1, 0x0

    .line 74
    .local v1, "cp":Lcom/beyond/sui/SUIKeypadButton;
    if-eqz v0, :cond_1

    .line 75
    invoke-virtual {v0, p2, p3, p1, p4}, Lcom/beyond/sui/SUIKeypadButton;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    if-lez v2, :cond_0

    .line 76
    iget v3, v0, Lcom/beyond/sui/SUIKeypadButton;->state_press:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    .line 77
    move-object v1, v0

    .line 83
    :cond_0
    :goto_0
    const/4 v2, 0x1

    .line 86
    :cond_1
    iget-object v3, p0, Lcom/beyond/sui/SUIKeypad;->pressed_btn:Lcom/beyond/sui/SUIKeypadButton;

    if-nez v3, :cond_4

    .line 87
    iput-object v1, p0, Lcom/beyond/sui/SUIKeypad;->pressed_btn:Lcom/beyond/sui/SUIKeypadButton;

    .line 96
    :cond_2
    :goto_1
    return v2

    .line 79
    :cond_3
    iget v3, v0, Lcom/beyond/sui/SUIKeypadButton;->key_code:I

    const/4 v4, -0x5

    if-ne v3, v4, :cond_0

    .line 80
    const-string v3, "swip_ok"

    iput-object v3, p0, Lcom/beyond/sui/SUIKeypad;->value:Ljava/lang/String;

    goto :goto_0

    .line 90
    :cond_4
    iget-object v3, p0, Lcom/beyond/sui/SUIKeypad;->pressed_btn:Lcom/beyond/sui/SUIKeypadButton;

    if-eq v3, v1, :cond_2

    .line 91
    iget-object v3, p0, Lcom/beyond/sui/SUIKeypad;->pressed_btn:Lcom/beyond/sui/SUIKeypadButton;

    const/4 v4, 0x2

    iput v4, v3, Lcom/beyond/sui/SUIKeypadButton;->state_press:I

    .line 92
    iput-object v1, p0, Lcom/beyond/sui/SUIKeypad;->pressed_btn:Lcom/beyond/sui/SUIKeypadButton;

    goto :goto_1
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 6
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    const/4 v5, 0x0

    .line 31
    iget-object v1, p0, Lcom/beyond/sui/SUIKeypad;->image_released:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    .line 32
    iget-object v1, p0, Lcom/beyond/sui/SUIKeypad;->image_released:Landroid/graphics/Bitmap;

    new-instance v2, Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/beyond/sui/SUIKeypad;->image_released:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v4, p0, Lcom/beyond/sui/SUIKeypad;->image_released:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-direct {v2, v5, v5, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v1, v2, p2, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 35
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/beyond/sui/SUIKeypad;->btns:[Lcom/beyond/sui/SUIKeypadButton;

    array-length v1, v1

    if-lt v0, v1, :cond_1

    .line 38
    return-void

    .line 36
    :cond_1
    iget-object v1, p0, Lcom/beyond/sui/SUIKeypad;->btns:[Lcom/beyond/sui/SUIKeypadButton;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1, p2, p3}, Lcom/beyond/sui/SUIKeypadButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 35
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
