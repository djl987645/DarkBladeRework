.class Lcom/beyond/sui/SUIJoystick;
.super Lcom/beyond/sui/SUIBase;
.source "SUIJoystick.java"


# instance fields
.field private buttonSelected:Lcom/beyond/sui/SUIButton;

.field private button_c:Lcom/beyond/sui/SUIButton;

.field private buttons:Ljava/util/Vector;

.field private pressed_btn:Lcom/beyond/sui/SUIButton;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 21
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 23
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUIJoystick;->buttons:Ljava/util/Vector;

    .line 24
    iput-object v1, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    .line 25
    iput-object v1, p0, Lcom/beyond/sui/SUIJoystick;->pressed_btn:Lcom/beyond/sui/SUIButton;

    .line 27
    iput-object v1, p0, Lcom/beyond/sui/SUIJoystick;->button_c:Lcom/beyond/sui/SUIButton;

    .line 21
    return-void
.end method

.method private getContainBtn(II)Lcom/beyond/sui/SUIButton;
    .locals 3
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 95
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/beyond/sui/SUIJoystick;->buttons:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-lt v1, v2, :cond_1

    .line 108
    const/4 v0, 0x0

    :cond_0
    return-object v0

    .line 96
    :cond_1
    iget-object v2, p0, Lcom/beyond/sui/SUIJoystick;->buttons:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIButton;

    .line 97
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    invoke-virtual {v0, p1, p2}, Lcom/beyond/sui/SUIButton;->contains(II)Z

    move-result v2

    if-nez v2, :cond_0

    .line 95
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 6
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    .line 37
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v3

    .line 38
    .local v3, "v":Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-nez v4, :cond_1

    .line 47
    const/4 v4, 0x1

    return v4

    .line 39
    :cond_1
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnanoxml/XMLElement;

    .line 40
    .local v1, "el":Lnanoxml/XMLElement;
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "button"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 41
    new-instance v0, Lcom/beyond/sui/SUIButton;

    invoke-direct {v0}, Lcom/beyond/sui/SUIButton;-><init>()V

    .line 42
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    const/4 v4, 0x0

    iput-boolean v4, v0, Lcom/beyond/sui/SUIButton;->isSendEvent:Z

    .line 43
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIButton;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 44
    iget-object v4, p0, Lcom/beyond/sui/SUIJoystick;->buttons:Ljava/util/Vector;

    invoke-virtual {v4, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method protected mouseEvnet(ILandroid/view/MotionEvent;Landroid/graphics/Rect;Landroid/view/View;)I
    .locals 7
    .param p1, "event"    # I
    .param p2, "arg0"    # Landroid/view/MotionEvent;
    .param p3, "rc"    # Landroid/graphics/Rect;
    .param p4, "jc"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x1

    const/4 v5, 0x2

    .line 52
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    invoke-direct {p0, v3, v4}, Lcom/beyond/sui/SUIJoystick;->getContainBtn(II)Lcom/beyond/sui/SUIButton;

    move-result-object v0

    .line 53
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    if-nez v0, :cond_1

    .line 54
    iget-object v2, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    if-eqz v2, :cond_0

    .line 55
    iget-object v2, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iput v5, v2, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 56
    iget-object v2, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iget v2, v2, Lcom/beyond/sui/SUIButton;->key_code:I

    invoke-static {v5, v2}, Lcom/beyond/sui/SUImanager;->sendWipiKeyEvent(II)V

    .line 57
    iput-object v6, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    .line 91
    :cond_0
    :goto_0
    return v1

    .line 62
    :cond_1
    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 65
    :pswitch_1
    iget-object v3, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    if-eq v0, v3, :cond_0

    .line 66
    iget-object v1, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    if-eqz v1, :cond_2

    .line 67
    iget-object v1, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iput v5, v1, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 68
    iget-object v1, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iget v1, v1, Lcom/beyond/sui/SUIButton;->key_code:I

    invoke-static {v5, v1}, Lcom/beyond/sui/SUImanager;->sendWipiKeyEvent(II)V

    .line 70
    :cond_2
    iput-object v0, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    .line 71
    iget-object v1, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iput v2, v1, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 72
    iget-object v1, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iget v1, v1, Lcom/beyond/sui/SUIButton;->key_code:I

    invoke-static {v2, v1}, Lcom/beyond/sui/SUImanager;->sendWipiKeyEvent(II)V

    move v1, v2

    .line 73
    goto :goto_0

    .line 77
    :pswitch_2
    iget-object v3, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    if-ne v0, v3, :cond_3

    .line 78
    iget-object v1, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iput v5, v1, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 79
    iget-object v1, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iget v1, v1, Lcom/beyond/sui/SUIButton;->key_code:I

    invoke-static {v5, v1}, Lcom/beyond/sui/SUImanager;->sendWipiKeyEvent(II)V

    .line 80
    iput-object v6, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    move v1, v2

    .line 81
    goto :goto_0

    .line 83
    :cond_3
    iget-object v2, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    if-eqz v2, :cond_0

    .line 84
    iget-object v2, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iput v5, v2, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 85
    iput-object v6, p0, Lcom/beyond/sui/SUIJoystick;->buttonSelected:Lcom/beyond/sui/SUIButton;

    goto :goto_0

    .line 62
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 3
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 30
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/beyond/sui/SUIJoystick;->buttons:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 34
    return-void

    .line 31
    :cond_0
    iget-object v2, p0, Lcom/beyond/sui/SUIJoystick;->buttons:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIButton;

    .line 32
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 30
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
