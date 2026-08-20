.class public Lcom/beyond/sui/SUIButton;
.super Lcom/beyond/sui/SUIBase;
.source "SUIButton.java"


# static fields
.field private static final HIDET_NONE:I = 0x0

.field private static final HIDET_THIS:I = 0x1


# instance fields
.field _mp:Landroid/media/MediaPlayer;

.field board:Lcom/beyond/sui/SUIBoard;

.field dbg_key_str:Ljava/lang/String;

.field hide_type:I

.field image_pressed:Landroid/graphics/Bitmap;

.field image_released:Landroid/graphics/Bitmap;

.field private inset_height:I

.field private inset_width:I

.field isSendEvent:Z

.field key_code:I

.field rect_s:Ljava/util/Vector;

.field sref:Ljava/lang/String;

.field state_press:I

.field text:Lcom/beyond/sui/SUIText;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 24
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 28
    iput v0, p0, Lcom/beyond/sui/SUIButton;->key_code:I

    .line 31
    iput-object v1, p0, Lcom/beyond/sui/SUIButton;->board:Lcom/beyond/sui/SUIBoard;

    .line 32
    iput-object v1, p0, Lcom/beyond/sui/SUIButton;->text:Lcom/beyond/sui/SUIText;

    .line 33
    iput-object v1, p0, Lcom/beyond/sui/SUIButton;->_mp:Landroid/media/MediaPlayer;

    .line 35
    iput v0, p0, Lcom/beyond/sui/SUIButton;->inset_width:I

    .line 36
    iput v0, p0, Lcom/beyond/sui/SUIButton;->inset_height:I

    .line 38
    iput-object v1, p0, Lcom/beyond/sui/SUIButton;->sref:Ljava/lang/String;

    .line 39
    iput v0, p0, Lcom/beyond/sui/SUIButton;->hide_type:I

    .line 41
    const/4 v0, 0x2

    iput v0, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/sui/SUIButton;->isSendEvent:Z

    .line 44
    iput-object v1, p0, Lcom/beyond/sui/SUIButton;->dbg_key_str:Ljava/lang/String;

    .line 47
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUIButton;->rect_s:Ljava/util/Vector;

    .line 24
    return-void
.end method

.method private handleKeyEvent(IZ)I
    .locals 4
    .param p1, "event"    # I
    .param p2, "in"    # Z

    .prologue
    const/4 v3, 0x2

    const/4 v1, 0x1

    .line 156
    iget v0, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 158
    .local v0, "old_state":I
    if-ne p1, v1, :cond_3

    .line 159
    if-eqz p2, :cond_2

    .line 160
    iget-boolean v2, p0, Lcom/beyond/sui/SUIButton;->isSendEvent:Z

    if-eqz v2, :cond_0

    .line 161
    iget v2, p0, Lcom/beyond/sui/SUIButton;->key_code:I

    invoke-static {v1, v2}, Lcom/beyond/sui/SUImanager;->sendWipiKeyEvent(II)V

    .line 162
    :cond_0
    iput v1, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 163
    iget-object v2, p0, Lcom/beyond/sui/SUIButton;->_mp:Landroid/media/MediaPlayer;

    if-eqz v2, :cond_1

    .line 164
    iget-object v2, p0, Lcom/beyond/sui/SUIButton;->_mp:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->start()V

    .line 185
    :cond_1
    :goto_0
    iget v2, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    if-eq v0, v2, :cond_7

    .line 189
    :goto_1
    return v1

    .line 167
    :cond_2
    iput v3, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    goto :goto_0

    .line 170
    :cond_3
    if-ne p1, v3, :cond_5

    .line 171
    if-eqz p2, :cond_4

    if-ne v0, v1, :cond_4

    .line 172
    iget-boolean v2, p0, Lcom/beyond/sui/SUIButton;->isSendEvent:Z

    if-eqz v2, :cond_4

    .line 173
    iget v2, p0, Lcom/beyond/sui/SUIButton;->key_code:I

    invoke-static {v3, v2}, Lcom/beyond/sui/SUImanager;->sendWipiKeyEvent(II)V

    .line 175
    :cond_4
    iput v3, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    goto :goto_0

    .line 177
    :cond_5
    const/4 v2, 0x5

    if-ne p1, v2, :cond_1

    .line 178
    if-nez p2, :cond_1

    if-ne v0, v1, :cond_1

    .line 179
    iget-boolean v2, p0, Lcom/beyond/sui/SUIButton;->isSendEvent:Z

    if-eqz v2, :cond_6

    .line 180
    iget v2, p0, Lcom/beyond/sui/SUIButton;->key_code:I

    invoke-static {v3, v2}, Lcom/beyond/sui/SUImanager;->sendWipiKeyEvent(II)V

    .line 181
    :cond_6
    iput v3, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    goto :goto_0

    .line 189
    :cond_7
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private handleSRef(IZ)I
    .locals 4
    .param p1, "event"    # I
    .param p2, "in"    # Z

    .prologue
    const/4 v1, 0x2

    const/4 v2, 0x1

    .line 193
    iget v0, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 195
    .local v0, "old_state":I
    if-ne p1, v2, :cond_3

    .line 196
    if-eqz p2, :cond_2

    .line 198
    iput v2, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    .line 215
    :cond_0
    :goto_0
    iget v1, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    if-eq v0, v1, :cond_5

    move v1, v2

    .line 219
    :cond_1
    :goto_1
    return v1

    .line 202
    :cond_2
    iput v1, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    goto :goto_0

    .line 205
    :cond_3
    if-ne p1, v1, :cond_0

    .line 206
    if-eqz p2, :cond_4

    if-ne v0, v2, :cond_4

    .line 208
    iget v3, p0, Lcom/beyond/sui/SUIButton;->hide_type:I

    if-eq v3, v2, :cond_1

    .line 213
    :cond_4
    iput v1, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    goto :goto_0

    .line 219
    :cond_5
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private parse_sref(Lnanoxml/XMLElement;)V
    .locals 2
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 89
    const-string v1, "sref"

    invoke-virtual {p1, v1}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/sui/SUIButton;->sref:Ljava/lang/String;

    .line 90
    const-string v1, "hide"

    invoke-virtual {p1, v1}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "ht":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 92
    const-string v1, "THIS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 93
    const/4 v1, 0x1

    iput v1, p0, Lcom/beyond/sui/SUIButton;->hide_type:I

    .line 95
    :cond_0
    return-void
.end method


# virtual methods
.method contains(II)Z
    .locals 4
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 223
    iget-boolean v3, p0, Lcom/beyond/sui/SUIButton;->isVisible:Z

    if-nez v3, :cond_1

    .line 224
    const/4 v1, 0x0

    .line 238
    :cond_0
    :goto_0
    return v1

    .line 226
    :cond_1
    const/4 v1, 0x0

    .line 227
    .local v1, "in":Z
    iget-object v3, p0, Lcom/beyond/sui/SUIButton;->rect_s:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 228
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v3, p0, Lcom/beyond/sui/SUIButton;->rect_s:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 229
    iget-object v3, p0, Lcom/beyond/sui/SUIButton;->rect_s:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Rect;

    .line 230
    .local v2, "r":Landroid/graphics/Rect;
    invoke-virtual {v2, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v1

    .line 231
    if-nez v1, :cond_0

    .line 228
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 236
    .end local v0    # "i":I
    .end local v2    # "r":Landroid/graphics/Rect;
    :cond_2
    iget-object v3, p0, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    invoke-virtual {v3, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v1

    goto :goto_0
.end method

.method protected makeAttr(Lnanoxml/XMLElement;)V
    .locals 1
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 151
    const-string v0, "inset_width"

    invoke-virtual {p1, v0}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/beyond/sui/SUIButton;->inset_width:I

    .line 152
    const-string v0, "inset_height"

    invoke-virtual {p1, v0}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/beyond/sui/SUIButton;->inset_height:I

    .line 153
    return-void
.end method

.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 13
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    .line 100
    const-string v0, "key_code"

    invoke-virtual {p1, v0}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/beyond/screen/KeyCode;->getCode4String(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/beyond/sui/SUIButton;->key_code:I

    .line 101
    const-string v0, "key_code"

    invoke-virtual {p1, v0}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/sui/SUIButton;->dbg_key_str:Ljava/lang/String;

    .line 103
    const-string v0, "sound"

    invoke-virtual {p1, v0}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 104
    .local v11, "s":Ljava/lang/String;
    if-eqz v11, :cond_0

    .line 106
    :try_start_0
    sget-object v0, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "res_pad/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 107
    .local v6, "afd":Landroid/content/res/AssetFileDescriptor;
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUIButton;->_mp:Landroid/media/MediaPlayer;

    .line 108
    iget-object v0, p0, Lcom/beyond/sui/SUIButton;->_mp:Landroid/media/MediaPlayer;

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 109
    iget-object v0, p0, Lcom/beyond/sui/SUIButton;->_mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .end local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v12

    .line 116
    .local v12, "v":Ljava/util/Vector;
    invoke-virtual {v12}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v10

    .local v10, "en":Ljava/util/Enumeration;
    :cond_1
    :goto_1
    invoke-interface {v10}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-nez v0, :cond_2

    .line 142
    iget v0, p0, Lcom/beyond/sui/SUIButton;->key_code:I

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/beyond/sui/SUIButton;->sref:Ljava/lang/String;

    if-nez v0, :cond_8

    .line 143
    const/4 v0, 0x0

    .line 145
    :goto_2
    return v0

    .line 110
    .end local v10    # "en":Ljava/util/Enumeration;
    .end local v12    # "v":Ljava/util/Vector;
    :catch_0
    move-exception v8

    .line 111
    .local v8, "e":Ljava/io/IOException;
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 117
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v10    # "en":Ljava/util/Enumeration;
    .restart local v12    # "v":Ljava/util/Vector;
    :cond_2
    invoke-interface {v10}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lnanoxml/XMLElement;

    .line 118
    .local v9, "el":Lnanoxml/XMLElement;
    invoke-virtual {v9}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "pressed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 119
    const-string v0, "image"

    invoke-virtual {v9, v0}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/beyond/sui/SUIButton;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/sui/SUIButton;->image_pressed:Landroid/graphics/Bitmap;

    goto :goto_1

    .line 121
    :cond_3
    invoke-virtual {v9}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "released"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 122
    const-string v0, "image"

    invoke-virtual {v9, v0}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/beyond/sui/SUIButton;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/sui/SUIButton;->image_released:Landroid/graphics/Bitmap;

    goto :goto_1

    .line 124
    :cond_4
    invoke-virtual {v9}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "text"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 125
    new-instance v7, Lcom/beyond/sui/SUIText;

    invoke-direct {v7}, Lcom/beyond/sui/SUIText;-><init>()V

    .line 126
    .local v7, "c":Lcom/beyond/sui/SUIText;
    invoke-virtual {v7, v9, p0}, Lcom/beyond/sui/SUIText;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 127
    iput-object v7, p0, Lcom/beyond/sui/SUIButton;->text:Lcom/beyond/sui/SUIText;

    goto :goto_1

    .line 129
    .end local v7    # "c":Lcom/beyond/sui/SUIText;
    :cond_5
    invoke-virtual {v9}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "board"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 130
    new-instance v7, Lcom/beyond/sui/SUIBoard;

    invoke-direct {v7}, Lcom/beyond/sui/SUIBoard;-><init>()V

    .line 131
    .local v7, "c":Lcom/beyond/sui/SUIBoard;
    invoke-virtual {v7, v9, p0}, Lcom/beyond/sui/SUIBoard;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 132
    iput-object v7, p0, Lcom/beyond/sui/SUIButton;->board:Lcom/beyond/sui/SUIBoard;

    goto :goto_1

    .line 134
    .end local v7    # "c":Lcom/beyond/sui/SUIBoard;
    :cond_6
    invoke-virtual {v9}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ref"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 135
    invoke-direct {p0, v9}, Lcom/beyond/sui/SUIButton;->parse_sref(Lnanoxml/XMLElement;)V

    goto/16 :goto_1

    .line 137
    :cond_7
    invoke-virtual {v9}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "rect_s"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 139
    iget-object v0, p0, Lcom/beyond/sui/SUIButton;->rect_s:Ljava/util/Vector;

    invoke-virtual {p0, v9}, Lcom/beyond/sui/SUIButton;->getRect(Lnanoxml/XMLElement;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/beyond/sui/SUIButton;->getScaledRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v1

    iget-object v2, p0, Lcom/beyond/sui/SUIButton;->parent:Lcom/beyond/sui/SUIBase;

    iget-object v2, v2, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0, v1, v2}, Lcom/beyond/sui/SUIButton;->getAbsoluteRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 145
    .end local v9    # "el":Lnanoxml/XMLElement;
    :cond_8
    const/4 v0, 0x1

    goto/16 :goto_2
.end method

.method protected mouseEvnet(ILandroid/view/MotionEvent;Landroid/graphics/Rect;Landroid/view/View;)I
    .locals 4
    .param p1, "event"    # I
    .param p2, "arg0"    # Landroid/view/MotionEvent;
    .param p3, "rc"    # Landroid/graphics/Rect;
    .param p4, "jc"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 242
    iget-boolean v2, p0, Lcom/beyond/sui/SUIButton;->isVisible:Z

    if-nez v2, :cond_1

    .line 257
    :cond_0
    :goto_0
    return v1

    .line 249
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p0, v2, v3}, Lcom/beyond/sui/SUIButton;->contains(II)Z

    move-result v0

    .line 251
    .local v0, "in":Z
    iget-object v2, p0, Lcom/beyond/sui/SUIButton;->sref:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 252
    invoke-direct {p0, p1, v0}, Lcom/beyond/sui/SUIButton;->handleSRef(IZ)I

    move-result v1

    goto :goto_0

    .line 254
    :cond_2
    iget v2, p0, Lcom/beyond/sui/SUIButton;->key_code:I

    if-eqz v2, :cond_0

    .line 255
    invoke-direct {p0, p1, v0}, Lcom/beyond/sui/SUIButton;->handleKeyEvent(IZ)I

    move-result v1

    goto :goto_0
.end method

.method protected onSetValue(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "componentType"    # I
    .param p2, "n"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 261
    const/16 v0, 0x9

    if-ne p1, v0, :cond_0

    .line 262
    const-string v0, "show"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 263
    if-nez p2, :cond_1

    .line 264
    invoke-virtual {p0, v1}, Lcom/beyond/sui/SUIButton;->setVisible(Z)V

    .line 279
    :cond_0
    :goto_0
    return v1

    .line 266
    :cond_1
    iget-object v0, p0, Lcom/beyond/sui/SUIButton;->name:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 267
    invoke-virtual {p0, v1}, Lcom/beyond/sui/SUIButton;->setVisible(Z)V

    goto :goto_0

    .line 270
    :cond_2
    const-string v0, "hide"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 271
    if-nez p2, :cond_3

    .line 272
    invoke-virtual {p0, v2}, Lcom/beyond/sui/SUIButton;->setVisible(Z)V

    goto :goto_0

    .line 274
    :cond_3
    iget-object v0, p0, Lcom/beyond/sui/SUIButton;->name:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    invoke-virtual {p0, v2}, Lcom/beyond/sui/SUIButton;->setVisible(Z)V

    goto :goto_0
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 10
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    const/4 v6, 0x0

    .line 52
    iget-boolean v3, p0, Lcom/beyond/sui/SUIButton;->isVisible:Z

    if-nez v3, :cond_1

    .line 86
    :cond_0
    :goto_0
    return-void

    .line 55
    :cond_1
    const/4 v2, 0x0

    .line 56
    .local v2, "img":Landroid/graphics/Bitmap;
    iget v3, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_6

    .line 57
    iget-object v2, p0, Lcom/beyond/sui/SUIButton;->image_released:Landroid/graphics/Bitmap;

    .line 62
    :cond_2
    :goto_1
    if-eqz v2, :cond_4

    .line 63
    const/4 v1, 0x0

    .line 64
    .local v1, "gw":I
    const/4 v0, 0x0

    .line 65
    .local v0, "gh":I
    iget-boolean v3, p0, Lcom/beyond/sui/SUIButton;->is_enlarge:Z

    if-eqz v3, :cond_3

    .line 66
    iget-boolean v3, p0, Lcom/beyond/sui/SUIButton;->is_effect:Z

    if-eqz v3, :cond_3

    .line 67
    iget v1, p0, Lcom/beyond/sui/SUIButton;->gap_width:I

    .line 68
    iget v0, p0, Lcom/beyond/sui/SUIButton;->gap_height:I

    .line 73
    :cond_3
    new-instance v3, Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-direct {v3, v6, v6, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 74
    new-instance v4, Landroid/graphics/Rect;

    iget v5, p2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v5, v1

    iget v6, p0, Lcom/beyond/sui/SUIButton;->inset_width:I

    add-int/2addr v5, v6

    iget v6, p2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v6, v0

    iget v7, p0, Lcom/beyond/sui/SUIButton;->inset_height:I

    add-int/2addr v6, v7

    .line 75
    iget v7, p2, Landroid/graphics/Rect;->left:I

    add-int/2addr v7, v1

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v8

    add-int/2addr v7, v8

    iget v8, p0, Lcom/beyond/sui/SUIButton;->inset_width:I

    sub-int/2addr v7, v8

    iget v8, p2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v8, v0

    iget v9, p0, Lcom/beyond/sui/SUIButton;->inset_height:I

    sub-int/2addr v8, v9

    .line 74
    invoke-direct {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 72
    invoke-virtual {p1, v2, v3, v4, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 79
    .end local v0    # "gh":I
    .end local v1    # "gw":I
    :cond_4
    iget-object v3, p0, Lcom/beyond/sui/SUIButton;->text:Lcom/beyond/sui/SUIText;

    if-eqz v3, :cond_5

    .line 80
    iget-object v3, p0, Lcom/beyond/sui/SUIButton;->text:Lcom/beyond/sui/SUIText;

    invoke-virtual {v3, p1, p2, p3}, Lcom/beyond/sui/SUIText;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 83
    :cond_5
    iget-object v3, p0, Lcom/beyond/sui/SUIButton;->board:Lcom/beyond/sui/SUIBoard;

    if-eqz v3, :cond_0

    .line 84
    iget-object v3, p0, Lcom/beyond/sui/SUIButton;->board:Lcom/beyond/sui/SUIBoard;

    invoke-virtual {v3, p1, p2, p3}, Lcom/beyond/sui/SUIBoard;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0

    .line 59
    :cond_6
    iget v3, p0, Lcom/beyond/sui/SUIButton;->state_press:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_2

    .line 60
    iget-object v2, p0, Lcom/beyond/sui/SUIButton;->image_pressed:Landroid/graphics/Bitmap;

    goto :goto_1
.end method
