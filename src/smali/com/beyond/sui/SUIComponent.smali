.class Lcom/beyond/sui/SUIComponent;
.super Lcom/beyond/sui/SUIBase;
.source "SUIComponent.java"


# instance fields
.field private animate_image:Ljava/lang/String;

.field board:Lcom/beyond/sui/SUIBoard;

.field button_list:Lcom/beyond/sui/SUIBtnList;

.field private buttons:Ljava/util/Vector;

.field private current_img_ix:I

.field private desc:Ljava/lang/String;

.field image:Landroid/graphics/Bitmap;

.field private image_count:I

.field protected image_height:I

.field protected image_width:I

.field isFlick:Z

.field isInvalid:Z

.field protected is_image_move:Z

.field joystick:Lcom/beyond/sui/SUIJoystick;

.field list:Lcom/beyond/sui/SUIList;

.field protected move_cur_x:I

.field protected move_cur_y:I

.field protected move_height:I

.field protected move_max_x:I

.field protected move_max_y:I

.field protected move_width:I

.field swip:Lcom/beyond/sui/SUISwip;

.field switcher:Lcom/beyond/sui/SUISwitch;

.field text:Lcom/beyond/sui/SUIText;

.field view:Lcom/beyond/sui/SUIView;

.field web:Lcom/beyond/sui/SUIWeb;


# direct methods
.method constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 23
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 27
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUIComponent;->buttons:Ljava/util/Vector;

    .line 37
    iput-boolean v1, p0, Lcom/beyond/sui/SUIComponent;->isFlick:Z

    .line 38
    iput-object v2, p0, Lcom/beyond/sui/SUIComponent;->desc:Ljava/lang/String;

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/sui/SUIComponent;->isInvalid:Z

    .line 42
    iput-boolean v1, p0, Lcom/beyond/sui/SUIComponent;->is_image_move:Z

    .line 43
    iput v1, p0, Lcom/beyond/sui/SUIComponent;->image_width:I

    .line 44
    iput v1, p0, Lcom/beyond/sui/SUIComponent;->image_height:I

    .line 45
    iput v1, p0, Lcom/beyond/sui/SUIComponent;->move_width:I

    .line 46
    iput v1, p0, Lcom/beyond/sui/SUIComponent;->move_height:I

    .line 47
    iput v1, p0, Lcom/beyond/sui/SUIComponent;->move_cur_x:I

    .line 48
    iput v1, p0, Lcom/beyond/sui/SUIComponent;->move_cur_y:I

    .line 49
    iput v1, p0, Lcom/beyond/sui/SUIComponent;->move_max_x:I

    .line 50
    iput v1, p0, Lcom/beyond/sui/SUIComponent;->move_max_y:I

    .line 52
    iput-object v2, p0, Lcom/beyond/sui/SUIComponent;->animate_image:Ljava/lang/String;

    .line 53
    iput v1, p0, Lcom/beyond/sui/SUIComponent;->image_count:I

    .line 54
    iput v1, p0, Lcom/beyond/sui/SUIComponent;->current_img_ix:I

    .line 23
    return-void
.end method

.method private setAnimatedImage(Z)V
    .locals 2
    .param p1, "isNext"    # Z

    .prologue
    .line 338
    iget v0, p0, Lcom/beyond/sui/SUIComponent;->image_count:I

    if-gtz v0, :cond_0

    .line 354
    :goto_0
    return-void

    .line 340
    :cond_0
    if-eqz p1, :cond_2

    .line 341
    iget v0, p0, Lcom/beyond/sui/SUIComponent;->current_img_ix:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/beyond/sui/SUIComponent;->current_img_ix:I

    .line 347
    :goto_1
    iget v0, p0, Lcom/beyond/sui/SUIComponent;->current_img_ix:I

    iget v1, p0, Lcom/beyond/sui/SUIComponent;->image_count:I

    if-lt v0, v1, :cond_3

    .line 348
    const/4 v0, 0x0

    iput v0, p0, Lcom/beyond/sui/SUIComponent;->current_img_ix:I

    .line 352
    :cond_1
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/beyond/sui/SUIComponent;->animate_image:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/beyond/sui/SUIComponent;->current_img_ix:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/beyond/sui/SUIComponent;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/sui/SUIComponent;->image:Landroid/graphics/Bitmap;

    goto :goto_0

    .line 344
    :cond_2
    iget v0, p0, Lcom/beyond/sui/SUIComponent;->current_img_ix:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/beyond/sui/SUIComponent;->current_img_ix:I

    goto :goto_1

    .line 349
    :cond_3
    iget v0, p0, Lcom/beyond/sui/SUIComponent;->current_img_ix:I

    if-gez v0, :cond_1

    .line 350
    iget v0, p0, Lcom/beyond/sui/SUIComponent;->image_count:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/beyond/sui/SUIComponent;->current_img_ix:I

    goto :goto_2
.end method


# virtual methods
.method protected getSelectedValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 293
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->button_list:Lcom/beyond/sui/SUIBtnList;

    if-eqz v0, :cond_0

    .line 294
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->button_list:Lcom/beyond/sui/SUIBtnList;

    invoke-virtual {v0}, Lcom/beyond/sui/SUIBtnList;->getSelectedValue()Ljava/lang/String;

    move-result-object v0

    .line 297
    :goto_0
    return-object v0

    .line 295
    :cond_0
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->list:Lcom/beyond/sui/SUIList;

    if-eqz v0, :cond_1

    .line 296
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->list:Lcom/beyond/sui/SUIList;

    invoke-virtual {v0}, Lcom/beyond/sui/SUIList;->getSelectedValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 297
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected makeAttr(Lnanoxml/XMLElement;)V
    .locals 4
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    const/4 v3, 0x1

    .line 216
    const-string v2, "image"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 217
    .local v0, "img_path":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 218
    invoke-static {v0}, Lcom/beyond/sui/SUIComponent;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/beyond/sui/SUIComponent;->image:Landroid/graphics/Bitmap;

    .line 220
    :cond_0
    const-string v2, "flick"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 221
    .local v1, "str":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 222
    const-string v2, "YES"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 223
    iput-boolean v3, p0, Lcom/beyond/sui/SUIComponent;->isFlick:Z

    .line 227
    :cond_1
    const-string v2, "image_width"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/beyond/sui/SUIComponent;->image_width:I

    .line 228
    const-string v2, "image_height"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/beyond/sui/SUIComponent;->image_height:I

    .line 229
    const-string v2, "move_width"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/beyond/sui/SUIComponent;->move_width:I

    .line 230
    const-string v2, "move_height"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/beyond/sui/SUIComponent;->move_height:I

    .line 231
    const-string v2, "move_max_x"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/beyond/sui/SUIComponent;->move_max_x:I

    .line 232
    const-string v2, "move_max_y"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/beyond/sui/SUIComponent;->move_max_y:I

    .line 234
    iget v2, p0, Lcom/beyond/sui/SUIComponent;->move_width:I

    if-nez v2, :cond_2

    iget v2, p0, Lcom/beyond/sui/SUIComponent;->move_height:I

    if-eqz v2, :cond_4

    .line 235
    :cond_2
    iput-boolean v3, p0, Lcom/beyond/sui/SUIComponent;->is_image_move:Z

    .line 237
    iget v2, p0, Lcom/beyond/sui/SUIComponent;->move_max_x:I

    if-nez v2, :cond_3

    iget v2, p0, Lcom/beyond/sui/SUIComponent;->move_width:I

    if-eqz v2, :cond_3

    .line 238
    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->image:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget v3, p0, Lcom/beyond/sui/SUIComponent;->image_width:I

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/beyond/sui/SUIComponent;->move_max_x:I

    .line 239
    :cond_3
    iget v2, p0, Lcom/beyond/sui/SUIComponent;->move_max_y:I

    if-nez v2, :cond_4

    iget v2, p0, Lcom/beyond/sui/SUIComponent;->move_height:I

    if-eqz v2, :cond_4

    .line 240
    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->image:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    iget v3, p0, Lcom/beyond/sui/SUIComponent;->image_height:I

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/beyond/sui/SUIComponent;->move_max_y:I

    .line 243
    :cond_4
    const-string v2, "animate_image"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/beyond/sui/SUIComponent;->animate_image:Ljava/lang/String;

    .line 244
    const-string v2, "image_count"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/beyond/sui/SUIComponent;->image_count:I

    .line 246
    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->animate_image:Ljava/lang/String;

    if-eqz v2, :cond_5

    .line 247
    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->animate_image:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/beyond/sui/SUIComponent;->current_img_ix:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".png"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/beyond/sui/SUIComponent;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/beyond/sui/SUIComponent;->image:Landroid/graphics/Bitmap;

    .line 249
    :cond_5
    return-void
.end method

.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 8
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    const/4 v7, 0x1

    .line 139
    const-string v5, "desc"

    invoke-virtual {p1, v5}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/beyond/sui/SUIComponent;->desc:Ljava/lang/String;

    .line 141
    const-string v5, "isAd"

    const/4 v6, 0x0

    invoke-static {p1, v5, v6}, Lcom/beyond/sui/SUIComponent;->getBoolean(Lnanoxml/XMLElement;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 142
    invoke-static {}, Lcom/beyond/ad/AdMgr;->isSupport()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 143
    const-string v5, "ad_cfg"

    invoke-virtual {p1, v5}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 144
    .local v3, "str":Ljava/lang/String;
    iget-object v5, p0, Lcom/beyond/sui/SUIComponent;->rect:Landroid/graphics/Rect;

    invoke-static {v7, v5}, Lcom/beyond/BeyondActivity;->requestAdView(ZLandroid/graphics/Rect;)V

    .line 212
    .end local v3    # "str":Ljava/lang/String;
    :cond_0
    return v7

    .line 150
    :cond_1
    const-string v5, "view"

    invoke-virtual {p1, v5}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 151
    .restart local v3    # "str":Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 152
    new-instance v5, Lcom/beyond/sui/SUIView;

    invoke-direct {v5}, Lcom/beyond/sui/SUIView;-><init>()V

    iput-object v5, p0, Lcom/beyond/sui/SUIComponent;->view:Lcom/beyond/sui/SUIView;

    .line 153
    iget-object v5, p0, Lcom/beyond/sui/SUIComponent;->view:Lcom/beyond/sui/SUIView;

    sget-object v6, Lcom/beyond/BeyondActivity;->context:Landroid/content/Context;

    invoke-virtual {v5, v6, v3}, Lcom/beyond/sui/SUIView;->loadXml(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 154
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/beyond/sui/SUIComponent;->view:Lcom/beyond/sui/SUIView;

    .line 157
    :cond_2
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v4

    .line 158
    .local v4, "v":Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "en":Ljava/util/Enumeration;
    :cond_3
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 159
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnanoxml/XMLElement;

    .line 160
    .local v1, "el":Lnanoxml/XMLElement;
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "text"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 161
    new-instance v0, Lcom/beyond/sui/SUIText;

    invoke-direct {v0}, Lcom/beyond/sui/SUIText;-><init>()V

    .line 162
    .local v0, "c":Lcom/beyond/sui/SUIText;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIText;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 163
    iput-object v0, p0, Lcom/beyond/sui/SUIComponent;->text:Lcom/beyond/sui/SUIText;

    goto :goto_0

    .line 165
    .end local v0    # "c":Lcom/beyond/sui/SUIText;
    :cond_4
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "board"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 166
    new-instance v0, Lcom/beyond/sui/SUIBoard;

    invoke-direct {v0}, Lcom/beyond/sui/SUIBoard;-><init>()V

    .line 167
    .local v0, "c":Lcom/beyond/sui/SUIBoard;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIBoard;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 168
    iput-object v0, p0, Lcom/beyond/sui/SUIComponent;->board:Lcom/beyond/sui/SUIBoard;

    goto :goto_0

    .line 170
    .end local v0    # "c":Lcom/beyond/sui/SUIBoard;
    :cond_5
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "button"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 171
    new-instance v0, Lcom/beyond/sui/SUIButton;

    invoke-direct {v0}, Lcom/beyond/sui/SUIButton;-><init>()V

    .line 172
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIButton;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 173
    iget-object v5, p0, Lcom/beyond/sui/SUIComponent;->buttons:Ljava/util/Vector;

    invoke-virtual {v5, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 176
    .end local v0    # "c":Lcom/beyond/sui/SUIButton;
    :cond_6
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "list"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 177
    new-instance v0, Lcom/beyond/sui/SUIList;

    invoke-direct {v0}, Lcom/beyond/sui/SUIList;-><init>()V

    .line 178
    .local v0, "c":Lcom/beyond/sui/SUIList;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIList;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 179
    iput-object v0, p0, Lcom/beyond/sui/SUIComponent;->list:Lcom/beyond/sui/SUIList;

    goto :goto_0

    .line 181
    .end local v0    # "c":Lcom/beyond/sui/SUIList;
    :cond_7
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "button_list"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 182
    new-instance v0, Lcom/beyond/sui/SUIBtnList;

    invoke-direct {v0}, Lcom/beyond/sui/SUIBtnList;-><init>()V

    .line 183
    .local v0, "c":Lcom/beyond/sui/SUIBtnList;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIBtnList;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 184
    iput-object v0, p0, Lcom/beyond/sui/SUIComponent;->button_list:Lcom/beyond/sui/SUIBtnList;

    goto/16 :goto_0

    .line 186
    .end local v0    # "c":Lcom/beyond/sui/SUIBtnList;
    :cond_8
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "joystick"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 187
    new-instance v0, Lcom/beyond/sui/SUIJoystick;

    invoke-direct {v0}, Lcom/beyond/sui/SUIJoystick;-><init>()V

    .line 188
    .local v0, "c":Lcom/beyond/sui/SUIJoystick;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIJoystick;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 189
    iput-object v0, p0, Lcom/beyond/sui/SUIComponent;->joystick:Lcom/beyond/sui/SUIJoystick;

    goto/16 :goto_0

    .line 191
    .end local v0    # "c":Lcom/beyond/sui/SUIJoystick;
    :cond_9
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "switch"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 192
    new-instance v0, Lcom/beyond/sui/SUISwitch;

    invoke-direct {v0}, Lcom/beyond/sui/SUISwitch;-><init>()V

    .line 193
    .local v0, "c":Lcom/beyond/sui/SUISwitch;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUISwitch;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 194
    iput-object v0, p0, Lcom/beyond/sui/SUIComponent;->switcher:Lcom/beyond/sui/SUISwitch;

    goto/16 :goto_0

    .line 196
    .end local v0    # "c":Lcom/beyond/sui/SUISwitch;
    :cond_a
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "swip"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 197
    new-instance v0, Lcom/beyond/sui/SUISwip;

    invoke-direct {v0}, Lcom/beyond/sui/SUISwip;-><init>()V

    .line 198
    .local v0, "c":Lcom/beyond/sui/SUISwip;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUISwip;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 199
    iput-object v0, p0, Lcom/beyond/sui/SUIComponent;->swip:Lcom/beyond/sui/SUISwip;

    goto/16 :goto_0

    .line 201
    .end local v0    # "c":Lcom/beyond/sui/SUISwip;
    :cond_b
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "web"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 202
    new-instance v0, Lcom/beyond/sui/SUIWeb;

    invoke-direct {v0}, Lcom/beyond/sui/SUIWeb;-><init>()V

    .line 203
    .local v0, "c":Lcom/beyond/sui/SUIWeb;
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIWeb;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 204
    iput-object v0, p0, Lcom/beyond/sui/SUIComponent;->web:Lcom/beyond/sui/SUIWeb;

    goto/16 :goto_0

    .line 206
    .end local v0    # "c":Lcom/beyond/sui/SUIWeb;
    :cond_c
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "background_color"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 207
    invoke-virtual {p0, v1}, Lcom/beyond/sui/SUIComponent;->getColor(Lnanoxml/XMLElement;)I

    move-result v5

    iput v5, p0, Lcom/beyond/sui/SUIComponent;->color:I

    goto/16 :goto_0
.end method

.method protected mouseEvnet(ILandroid/view/MotionEvent;Landroid/graphics/Rect;Landroid/view/View;)I
    .locals 5
    .param p1, "event"    # I
    .param p2, "arg0"    # Landroid/view/MotionEvent;
    .param p3, "rc"    # Landroid/graphics/Rect;
    .param p4, "jc"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x1

    .line 254
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->list:Lcom/beyond/sui/SUIList;

    if-eqz v4, :cond_1

    move v2, v3

    .line 289
    :cond_0
    :goto_0
    return v2

    .line 258
    :cond_1
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->button_list:Lcom/beyond/sui/SUIBtnList;

    if-eqz v4, :cond_2

    .line 259
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->button_list:Lcom/beyond/sui/SUIBtnList;

    invoke-virtual {v4, p2, p3, p1, p4}, Lcom/beyond/sui/SUIBtnList;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    .local v2, "ret":I
    if-eqz v2, :cond_2

    move v2, v3

    .line 260
    goto :goto_0

    .line 262
    .end local v2    # "ret":I
    :cond_2
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->text:Lcom/beyond/sui/SUIText;

    if-eqz v4, :cond_3

    .line 263
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->text:Lcom/beyond/sui/SUIText;

    invoke-virtual {v4, p2, p3, p1, p4}, Lcom/beyond/sui/SUIText;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    .restart local v2    # "ret":I
    if-nez v2, :cond_0

    .line 267
    .end local v2    # "ret":I
    :cond_3
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->buttons:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-lt v1, v4, :cond_4

    .line 272
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->swip:Lcom/beyond/sui/SUISwip;

    if-eqz v4, :cond_6

    .line 273
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->swip:Lcom/beyond/sui/SUISwip;

    invoke-virtual {v4, p2, p3, p1, p4}, Lcom/beyond/sui/SUISwip;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    .restart local v2    # "ret":I
    if-eqz v2, :cond_6

    move v2, v3

    .line 274
    goto :goto_0

    .line 268
    .end local v2    # "ret":I
    :cond_4
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->buttons:Ljava/util/Vector;

    invoke-virtual {v4, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIButton;

    .line 269
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    invoke-virtual {v0, p2, p3, p1, p4}, Lcom/beyond/sui/SUIButton;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    .restart local v2    # "ret":I
    if-eqz v2, :cond_5

    move v2, v3

    .line 270
    goto :goto_0

    .line 267
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 276
    .end local v0    # "c":Lcom/beyond/sui/SUIButton;
    .end local v2    # "ret":I
    :cond_6
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->switcher:Lcom/beyond/sui/SUISwitch;

    if-eqz v4, :cond_7

    .line 277
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->switcher:Lcom/beyond/sui/SUISwitch;

    invoke-virtual {v4, p2, p3, p1, p4}, Lcom/beyond/sui/SUISwitch;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    .restart local v2    # "ret":I
    if-eqz v2, :cond_7

    move v2, v3

    .line 278
    goto :goto_0

    .line 280
    .end local v2    # "ret":I
    :cond_7
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->joystick:Lcom/beyond/sui/SUIJoystick;

    if-eqz v4, :cond_8

    .line 281
    iget-object v4, p0, Lcom/beyond/sui/SUIComponent;->joystick:Lcom/beyond/sui/SUIJoystick;

    invoke-virtual {v4, p2, p3, p1, p4}, Lcom/beyond/sui/SUIJoystick;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    .restart local v2    # "ret":I
    if-eqz v2, :cond_8

    move v2, v3

    .line 282
    goto :goto_0

    .line 285
    .end local v2    # "ret":I
    :cond_8
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->view:Lcom/beyond/sui/SUIView;

    if-eqz v3, :cond_9

    .line 286
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->view:Lcom/beyond/sui/SUIView;

    invoke-virtual {v3, p2, p3, p1, p4}, Lcom/beyond/sui/SUIView;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v2

    .restart local v2    # "ret":I
    if-nez v2, :cond_0

    .line 289
    .end local v2    # "ret":I
    :cond_9
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected onGetValue(ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "componentType"    # I
    .param p2, "n"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 309
    const/4 v1, 0x2

    if-ne p1, v1, :cond_1

    .line 310
    invoke-virtual {p0, p2}, Lcom/beyond/sui/SUIComponent;->getValueStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 334
    :cond_0
    :goto_0
    return-object v0

    .line 312
    :cond_1
    const/4 v1, 0x5

    if-ne p1, v1, :cond_2

    .line 313
    invoke-virtual {p0}, Lcom/beyond/sui/SUIComponent;->getSelectedValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 315
    :cond_2
    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    .line 318
    const/16 v1, 0x8

    if-ne p1, v1, :cond_3

    .line 319
    iget-object v1, p0, Lcom/beyond/sui/SUIComponent;->switcher:Lcom/beyond/sui/SUISwitch;

    if-eqz v1, :cond_0

    .line 320
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->switcher:Lcom/beyond/sui/SUISwitch;

    invoke-virtual {v0, p1, p2}, Lcom/beyond/sui/SUISwitch;->onGetValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 323
    :cond_3
    const/16 v1, 0xa

    if-eq p1, v1, :cond_4

    const/16 v1, 0xb

    if-ne p1, v1, :cond_0

    .line 324
    :cond_4
    iget-object v1, p0, Lcom/beyond/sui/SUIComponent;->swip:Lcom/beyond/sui/SUISwip;

    if-eqz v1, :cond_0

    .line 326
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->swip:Lcom/beyond/sui/SUISwip;

    invoke-virtual {v0, p1, p2}, Lcom/beyond/sui/SUISwip;->getValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

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

    .line 358
    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->view:Lcom/beyond/sui/SUIView;

    if-eqz v2, :cond_0

    .line 359
    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->view:Lcom/beyond/sui/SUIView;

    invoke-virtual {v2, p1, p2, p3}, Lcom/beyond/sui/SUIView;->setValue(ILjava/lang/String;Ljava/lang/String;)Z

    .line 361
    :cond_0
    const/4 v2, 0x2

    if-ne p1, v2, :cond_9

    .line 362
    if-eqz p2, :cond_7

    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->name:Ljava/lang/String;

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->name:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 363
    const-string v2, "next_image"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 364
    invoke-direct {p0, v0}, Lcom/beyond/sui/SUIComponent;->setAnimatedImage(Z)V

    :cond_1
    :goto_0
    move v0, v1

    .line 418
    :cond_2
    :goto_1
    return v0

    .line 366
    :cond_3
    const-string v2, "previous_image"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 367
    invoke-direct {p0, v1}, Lcom/beyond/sui/SUIComponent;->setAnimatedImage(Z)V

    goto :goto_0

    .line 369
    :cond_4
    const-string v2, "show_ad"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 370
    invoke-static {v0}, Lcom/beyond/BeyondActivity;->showAdView(Z)V

    goto :goto_0

    .line 372
    :cond_5
    const-string v0, "hide_ad"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 373
    invoke-static {v1}, Lcom/beyond/BeyondActivity;->showAdView(Z)V

    goto :goto_0

    .line 376
    :cond_6
    invoke-virtual {p0, p2, p3}, Lcom/beyond/sui/SUIComponent;->setValueStr(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 380
    :cond_7
    iget-object v1, p0, Lcom/beyond/sui/SUIComponent;->web:Lcom/beyond/sui/SUIWeb;

    if-eqz v1, :cond_8

    .line 381
    iget-object v1, p0, Lcom/beyond/sui/SUIComponent;->web:Lcom/beyond/sui/SUIWeb;

    invoke-virtual {v1, p1, p2, p3}, Lcom/beyond/sui/SUIWeb;->setValue(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 384
    :cond_8
    invoke-virtual {p0, p2, p3}, Lcom/beyond/sui/SUIComponent;->setValueStr(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    goto :goto_1

    .line 387
    :cond_9
    const/4 v2, 0x5

    if-ne p1, v2, :cond_a

    .line 388
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, p2, v0}, Lcom/beyond/sui/SUIComponent;->setSelectedIndex(Ljava/lang/String;I)Z

    move-result v0

    goto :goto_1

    .line 390
    :cond_a
    const/4 v2, 0x7

    if-ne p1, v2, :cond_b

    .line 391
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->text:Lcom/beyond/sui/SUIText;

    if-eqz v0, :cond_1

    .line 392
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->text:Lcom/beyond/sui/SUIText;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIText;->setValue(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    goto :goto_1

    .line 394
    :cond_b
    const/16 v2, 0x8

    if-ne p1, v2, :cond_c

    .line 395
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->switcher:Lcom/beyond/sui/SUISwitch;

    if-eqz v0, :cond_1

    .line 396
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->switcher:Lcom/beyond/sui/SUISwitch;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUISwitch;->onSetValue(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    goto :goto_1

    .line 399
    :cond_c
    const/16 v2, 0xb

    if-ne p1, v2, :cond_d

    .line 400
    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->swip:Lcom/beyond/sui/SUISwip;

    if-eqz v2, :cond_1

    .line 401
    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->swip:Lcom/beyond/sui/SUISwip;

    iget-object v2, v2, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    if-eqz v2, :cond_1

    .line 402
    iget-object v1, p0, Lcom/beyond/sui/SUIComponent;->swip:Lcom/beyond/sui/SUISwip;

    iget-object v1, v1, Lcom/beyond/sui/SUISwip;->text:Lcom/beyond/sui/SUIText;

    invoke-virtual {v1, p3}, Lcom/beyond/sui/SUIText;->setText(Ljava/lang/String;)V

    goto :goto_1

    .line 407
    :cond_d
    const/4 v2, 0x3

    if-ne p1, v2, :cond_e

    .line 408
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->text:Lcom/beyond/sui/SUIText;

    if-eqz v0, :cond_1

    .line 409
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->text:Lcom/beyond/sui/SUIText;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIText;->setValue(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_1

    .line 413
    :cond_e
    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->web:Lcom/beyond/sui/SUIWeb;

    if-eqz v2, :cond_1

    .line 414
    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->web:Lcom/beyond/sui/SUIWeb;

    invoke-virtual {v2, p1, p2, p3}, Lcom/beyond/sui/SUIWeb;->setValue(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto/16 :goto_1
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 11
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    const/4 v5, 0x0

    .line 59
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->image:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_4

    .line 61
    iget v3, p0, Lcom/beyond/sui/SUIComponent;->image_width:I

    if-nez v3, :cond_0

    .line 62
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->image:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iput v3, p0, Lcom/beyond/sui/SUIComponent;->image_width:I

    .line 63
    :cond_0
    iget v3, p0, Lcom/beyond/sui/SUIComponent;->image_height:I

    if-nez v3, :cond_1

    .line 64
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->image:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iput v3, p0, Lcom/beyond/sui/SUIComponent;->image_height:I

    .line 66
    :cond_1
    iget-boolean v3, p0, Lcom/beyond/sui/SUIComponent;->is_image_move:Z

    if-eqz v3, :cond_3

    .line 67
    iget v3, p0, Lcom/beyond/sui/SUIComponent;->move_cur_x:I

    iget v4, p0, Lcom/beyond/sui/SUIComponent;->move_width:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/beyond/sui/SUIComponent;->move_cur_x:I

    .line 68
    iget v3, p0, Lcom/beyond/sui/SUIComponent;->move_cur_y:I

    iget v4, p0, Lcom/beyond/sui/SUIComponent;->move_height:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/beyond/sui/SUIComponent;->move_cur_y:I

    .line 70
    iget v3, p0, Lcom/beyond/sui/SUIComponent;->move_cur_x:I

    iget v4, p0, Lcom/beyond/sui/SUIComponent;->move_max_x:I

    if-le v3, v4, :cond_2

    .line 71
    iput v5, p0, Lcom/beyond/sui/SUIComponent;->move_cur_x:I

    .line 72
    :cond_2
    iget v3, p0, Lcom/beyond/sui/SUIComponent;->move_cur_y:I

    iget v4, p0, Lcom/beyond/sui/SUIComponent;->move_max_y:I

    if-le v3, v4, :cond_3

    .line 73
    iput v5, p0, Lcom/beyond/sui/SUIComponent;->move_cur_y:I

    .line 76
    :cond_3
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->image:Landroid/graphics/Bitmap;

    .line 77
    new-instance v4, Landroid/graphics/Rect;

    iget v5, p0, Lcom/beyond/sui/SUIComponent;->move_cur_x:I

    iget v6, p0, Lcom/beyond/sui/SUIComponent;->move_cur_y:I

    iget v7, p0, Lcom/beyond/sui/SUIComponent;->image_width:I

    iget v8, p0, Lcom/beyond/sui/SUIComponent;->move_cur_x:I

    add-int/2addr v7, v8

    iget v8, p0, Lcom/beyond/sui/SUIComponent;->image_height:I

    iget v9, p0, Lcom/beyond/sui/SUIComponent;->move_cur_y:I

    add-int/2addr v8, v9

    invoke-direct {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 78
    new-instance v5, Landroid/graphics/Rect;

    iget v6, p2, Landroid/graphics/Rect;->left:I

    iget v7, p2, Landroid/graphics/Rect;->top:I

    iget v8, p2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v9

    add-int/2addr v8, v9

    iget v9, p2, Landroid/graphics/Rect;->top:I

    iget-object v10, p0, Lcom/beyond/sui/SUIComponent;->rect:Landroid/graphics/Rect;

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v10

    add-int/2addr v9, v10

    invoke-direct {v5, v6, v7, v8, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 76
    invoke-virtual {p1, v3, v4, v5, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 88
    :cond_4
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->buttons:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-lt v1, v3, :cond_f

    .line 93
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->text:Lcom/beyond/sui/SUIText;

    if-eqz v3, :cond_5

    .line 94
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->text:Lcom/beyond/sui/SUIText;

    invoke-virtual {v3, p1, p2, p3}, Lcom/beyond/sui/SUIText;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 97
    :cond_5
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->board:Lcom/beyond/sui/SUIBoard;

    if-eqz v3, :cond_6

    .line 98
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->board:Lcom/beyond/sui/SUIBoard;

    invoke-virtual {v3, p1, p2, p3}, Lcom/beyond/sui/SUIBoard;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 104
    :cond_6
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->button_list:Lcom/beyond/sui/SUIBtnList;

    if-eqz v3, :cond_7

    .line 105
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->button_list:Lcom/beyond/sui/SUIBtnList;

    invoke-virtual {v3, p1, p2, p3}, Lcom/beyond/sui/SUIBtnList;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 108
    :cond_7
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->joystick:Lcom/beyond/sui/SUIJoystick;

    if-eqz v3, :cond_8

    .line 109
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->joystick:Lcom/beyond/sui/SUIJoystick;

    invoke-virtual {v3, p1, p2, p3}, Lcom/beyond/sui/SUIJoystick;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 111
    :cond_8
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->switcher:Lcom/beyond/sui/SUISwitch;

    if-eqz v3, :cond_9

    .line 112
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->switcher:Lcom/beyond/sui/SUISwitch;

    invoke-virtual {v3, p1, p2, p3}, Lcom/beyond/sui/SUISwitch;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 114
    :cond_9
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->swip:Lcom/beyond/sui/SUISwip;

    if-eqz v3, :cond_a

    .line 115
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->swip:Lcom/beyond/sui/SUISwip;

    invoke-virtual {v3, p1, p2, p3}, Lcom/beyond/sui/SUISwip;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 117
    :cond_a
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->view:Lcom/beyond/sui/SUIView;

    if-eqz v3, :cond_b

    .line 118
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->view:Lcom/beyond/sui/SUIView;

    invoke-virtual {v3, p1, p2, p3}, Lcom/beyond/sui/SUIView;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 121
    :cond_b
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/beyond/sui/SUIComponent;->isDebug(I)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 122
    invoke-virtual {p0}, Lcom/beyond/sui/SUIComponent;->getNameStr()Ljava/lang/String;

    move-result-object v2

    .line 123
    .local v2, "msg":Ljava/lang/String;
    if-nez v2, :cond_c

    .line 124
    iget-object v2, p0, Lcom/beyond/sui/SUIComponent;->desc:Ljava/lang/String;

    .line 125
    :cond_c
    if-nez v2, :cond_d

    .line 126
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->list:Lcom/beyond/sui/SUIList;

    if-eqz v3, :cond_d

    .line 127
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->list:Lcom/beyond/sui/SUIList;

    invoke-virtual {v3}, Lcom/beyond/sui/SUIList;->getNameStr()Ljava/lang/String;

    move-result-object v2

    .line 132
    :cond_d
    invoke-virtual {p0, p1, v2, p3}, Lcom/beyond/sui/SUIComponent;->drawDebug(Landroid/graphics/Canvas;Ljava/lang/String;Landroid/graphics/Paint;)V

    .line 134
    .end local v2    # "msg":Ljava/lang/String;
    :cond_e
    return-void

    .line 89
    :cond_f
    iget-object v3, p0, Lcom/beyond/sui/SUIComponent;->buttons:Ljava/util/Vector;

    invoke-virtual {v3, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIButton;

    .line 90
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 88
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method protected setSelectedIndex(Ljava/lang/String;I)Z
    .locals 1
    .param p1, "n"    # Ljava/lang/String;
    .param p2, "v"    # I

    .prologue
    .line 301
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->button_list:Lcom/beyond/sui/SUIBtnList;

    if-eqz v0, :cond_0

    .line 302
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->button_list:Lcom/beyond/sui/SUIBtnList;

    invoke-virtual {v0, p2}, Lcom/beyond/sui/SUIBtnList;->setSelectedIndex(I)Z

    move-result v0

    .line 305
    :goto_0
    return v0

    .line 303
    :cond_0
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->list:Lcom/beyond/sui/SUIList;

    if-eqz v0, :cond_1

    .line 304
    iget-object v0, p0, Lcom/beyond/sui/SUIComponent;->list:Lcom/beyond/sui/SUIList;

    invoke-virtual {v0, p2}, Lcom/beyond/sui/SUIList;->setSelectedIndex(I)Z

    move-result v0

    goto :goto_0

    .line 305
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
