.class public Lcom/beyond/screen/ScreenConfig;
.super Ljava/lang/Object;
.source "ScreenConfig.java"


# static fields
.field static final MODE_LANDSCAPE:I = 0x0

.field static final MODE_PORTRAIT:I = 0x1

.field private static annun_info:Lcom/beyond/screen/AnnunInfo; = null

.field private static final configFileName:Ljava/lang/String; = "res_pad/screen.cfg"

.field private static final configVersion:Ljava/lang/String; = "0.0.02"

.field private static configXml:Lnanoxml/XMLElement;

.field protected static gameDisplaySize:Landroid/graphics/Rect;

.field private static isClet:Z

.field static userFontSize:[I


# instance fields
.field carrier_socket:Lorg/kwis/msf/io/Socket;

.field landscapeScreen:Lcom/beyond/screen/Screen;

.field public portraitScreen:Lcom/beyond/screen/Screen;

.field protected screen_cfg_mode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 46
    sput-object v0, Lcom/beyond/screen/ScreenConfig;->configXml:Lnanoxml/XMLElement;

    .line 54
    sput-object v0, Lcom/beyond/screen/ScreenConfig;->gameDisplaySize:Landroid/graphics/Rect;

    .line 55
    sput-object v0, Lcom/beyond/screen/ScreenConfig;->userFontSize:[I

    .line 57
    new-instance v0, Lcom/beyond/screen/AnnunInfo;

    invoke-direct {v0}, Lcom/beyond/screen/AnnunInfo;-><init>()V

    sput-object v0, Lcom/beyond/screen/ScreenConfig;->annun_info:Lcom/beyond/screen/AnnunInfo;

    .line 58
    const/4 v0, 0x0

    sput-boolean v0, Lcom/beyond/screen/ScreenConfig;->isClet:Z

    .line 42
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object v0, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    .line 53
    iput-object v0, p0, Lcom/beyond/screen/ScreenConfig;->landscapeScreen:Lcom/beyond/screen/Screen;

    .line 60
    iput-object v0, p0, Lcom/beyond/screen/ScreenConfig;->carrier_socket:Lorg/kwis/msf/io/Socket;

    .line 42
    return-void
.end method

.method public static getAnnunInfo()Lcom/beyond/screen/AnnunInfo;
    .locals 1

    .prologue
    .line 99
    sget-object v0, Lcom/beyond/screen/ScreenConfig;->annun_info:Lcom/beyond/screen/AnnunInfo;

    return-object v0
.end method

.method private getColor(Lnanoxml/XMLElement;)I
    .locals 4
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 288
    const-string v3, "red"

    invoke-virtual {p1, v3}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    .line 289
    .local v2, "r":I
    const-string v3, "green"

    invoke-virtual {p1, v3}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v1

    .line 290
    .local v1, "g":I
    const-string v3, "blue"

    invoke-virtual {p1, v3}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    .line 291
    .local v0, "b":I
    invoke-static {v2, v1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    return v3
.end method

.method public static getUserFontSize()[I
    .locals 1

    .prologue
    .line 103
    sget-object v0, Lcom/beyond/screen/ScreenConfig;->userFontSize:[I

    return-object v0
.end method

.method public static isClet()Z
    .locals 1

    .prologue
    .line 363
    sget-boolean v0, Lcom/beyond/screen/ScreenConfig;->isClet:Z

    return v0
.end method

.method private parseAnnun(Lcom/beyond/screen/AnnunInfo;Lnanoxml/XMLElement;)V
    .locals 5
    .param p1, "info"    # Lcom/beyond/screen/AnnunInfo;
    .param p2, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 239
    const-string v3, "height"

    invoke-virtual {p2, v3}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v3

    iput v3, p1, Lcom/beyond/screen/AnnunInfo;->height:I

    .line 240
    const-string v3, "annun_image"

    invoke-virtual {p2, v3}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p1, Lcom/beyond/screen/AnnunInfo;->img_path:Ljava/lang/String;

    .line 241
    invoke-virtual {p2}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v2

    .line 242
    .local v2, "v":Ljava/util/Vector;
    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_1

    .line 251
    return-void

    .line 243
    :cond_1
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnanoxml/XMLElement;

    .line 244
    .local v0, "child":Lnanoxml/XMLElement;
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "background_color"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 245
    invoke-direct {p0, v0}, Lcom/beyond/screen/ScreenConfig;->getColor(Lnanoxml/XMLElement;)I

    move-result v3

    iput v3, p1, Lcom/beyond/screen/AnnunInfo;->bg:I

    goto :goto_0

    .line 247
    :cond_2
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "annun_image_rect"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 248
    invoke-virtual {p0, v0}, Lcom/beyond/screen/ScreenConfig;->getRect(Lnanoxml/XMLElement;)Landroid/graphics/Rect;

    move-result-object v3

    iput-object v3, p1, Lcom/beyond/screen/AnnunInfo;->img_rc:Landroid/graphics/Rect;

    goto :goto_0
.end method

.method private parseButton(Landroid/content/Context;Lnanoxml/XMLElement;)Lcom/beyond/screen/KeyButton;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "el"    # Lnanoxml/XMLElement;

    .prologue
    const/4 v8, 0x0

    .line 325
    new-instance v1, Lcom/beyond/screen/KeyButton;

    invoke-direct {v1, p1}, Lcom/beyond/screen/KeyButton;-><init>(Landroid/content/Context;)V

    .line 327
    .local v1, "btn":Lcom/beyond/screen/KeyButton;
    const-string v6, "button_image"

    invoke-virtual {p2, v6}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, p1, v6, v8}, Lcom/beyond/screen/KeyButton;->loadImage(Landroid/content/Context;Ljava/lang/String;I)V

    .line 328
    const-string v6, "pressed_image"

    invoke-virtual {p2, v6}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v1, p1, v6, v7}, Lcom/beyond/screen/KeyButton;->loadImage(Landroid/content/Context;Ljava/lang/String;I)V

    .line 330
    const-string v6, "key_code"

    invoke-virtual {p2, v6}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 331
    .local v4, "key_code":Ljava/lang/String;
    invoke-static {v4}, Lcom/beyond/screen/KeyCode;->getCode4String(Ljava/lang/String;)I

    move-result v6

    iput v6, v1, Lcom/beyond/screen/KeyButton;->key_code:I

    .line 332
    const-string v6, "name"

    invoke-virtual {p2, v6}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lcom/beyond/screen/KeyButton;->name:Ljava/lang/String;

    .line 333
    const-string v6, "is_show"

    invoke-virtual {p2, v6}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 334
    .local v0, "bShow":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 335
    const-string v6, "NO"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 336
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iput-object v6, v1, Lcom/beyond/screen/KeyButton;->isShow:Ljava/lang/Boolean;

    .line 339
    :cond_0
    invoke-virtual {p2}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v5

    .line 340
    .local v5, "v":Ljava/util/Vector;
    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "en":Ljava/util/Enumeration;
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-nez v6, :cond_2

    .line 348
    return-object v1

    .line 341
    :cond_2
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnanoxml/XMLElement;

    .line 342
    .local v2, "child":Lnanoxml/XMLElement;
    invoke-virtual {v2}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "window"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 343
    invoke-virtual {p0, v2}, Lcom/beyond/screen/ScreenConfig;->getRect(Lnanoxml/XMLElement;)Landroid/graphics/Rect;

    move-result-object v6

    iput-object v6, v1, Lcom/beyond/screen/KeyButton;->rect:Landroid/graphics/Rect;

    goto :goto_0

    .line 344
    :cond_3
    invoke-virtual {v2}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "background_color"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 345
    invoke-direct {p0, v2}, Lcom/beyond/screen/ScreenConfig;->getColor(Lnanoxml/XMLElement;)I

    move-result v6

    iput v6, v1, Lcom/beyond/screen/KeyButton;->bg:I

    goto :goto_0
.end method

.method private parseFont(Lnanoxml/XMLElement;)V
    .locals 3
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 272
    const/4 v0, 0x3

    new-array v0, v0, [I

    sput-object v0, Lcom/beyond/screen/ScreenConfig;->userFontSize:[I

    .line 273
    sget-object v0, Lcom/beyond/screen/ScreenConfig;->userFontSize:[I

    const/4 v1, 0x0

    const-string v2, "font_small"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    .line 274
    sget-object v0, Lcom/beyond/screen/ScreenConfig;->userFontSize:[I

    const/4 v1, 0x1

    const-string v2, "font_medium"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    .line 275
    sget-object v0, Lcom/beyond/screen/ScreenConfig;->userFontSize:[I

    const/4 v1, 0x2

    const-string v2, "font_large"

    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    .line 276
    return-void
.end method

.method private parsePad(Landroid/content/Context;Lnanoxml/XMLElement;)Lcom/beyond/screen/KeyPad;
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 297
    new-instance v3, Lcom/beyond/screen/KeyPad;

    invoke-direct {v3, p1}, Lcom/beyond/screen/KeyPad;-><init>(Landroid/content/Context;)V

    .line 298
    .local v3, "pad":Lcom/beyond/screen/KeyPad;
    const/16 v5, 0x14

    new-array v5, v5, [Lcom/beyond/screen/KeyButton;

    iput-object v5, v3, Lcom/beyond/screen/KeyPad;->btns:[Lcom/beyond/screen/KeyButton;

    .line 299
    invoke-virtual {v3}, Lcom/beyond/screen/KeyPad;->init()V

    .line 301
    const-string v5, "image"

    invoke-virtual {p2, v5}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/beyond/screen/KeyPad;->loadImage(Ljava/lang/String;)V

    .line 303
    invoke-virtual {p2}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v4

    .line 304
    .local v4, "v":Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_1

    .line 318
    iget v5, v3, Lcom/beyond/screen/KeyPad;->bg:I

    invoke-virtual {v3, v5}, Lcom/beyond/screen/KeyPad;->setBackgroundColor(I)V

    .line 319
    return-object v3

    .line 305
    :cond_1
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnanoxml/XMLElement;

    .line 306
    .local v1, "child":Lnanoxml/XMLElement;
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "window"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 307
    invoke-virtual {p0, v1}, Lcom/beyond/screen/ScreenConfig;->getRect(Lnanoxml/XMLElement;)Landroid/graphics/Rect;

    move-result-object v5

    iput-object v5, v3, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    .line 308
    iget-object v5, v3, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget-object v6, v3, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    iget-object v7, v3, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    iget-object v8, v3, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v3, v5, v6, v7, v8}, Lcom/beyond/screen/KeyPad;->layout(IIII)V

    goto :goto_0

    .line 310
    :cond_2
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "background_color"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 311
    invoke-direct {p0, v1}, Lcom/beyond/screen/ScreenConfig;->getColor(Lnanoxml/XMLElement;)I

    move-result v5

    iput v5, v3, Lcom/beyond/screen/KeyPad;->bg:I

    goto :goto_0

    .line 312
    :cond_3
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "key_button"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 313
    invoke-direct {p0, p1, v1}, Lcom/beyond/screen/ScreenConfig;->parseButton(Landroid/content/Context;Lnanoxml/XMLElement;)Lcom/beyond/screen/KeyButton;

    move-result-object v0

    .line 314
    .local v0, "btn":Lcom/beyond/screen/KeyButton;
    iget-object v5, v3, Lcom/beyond/screen/KeyPad;->btns:[Lcom/beyond/screen/KeyButton;

    iget v6, v3, Lcom/beyond/screen/KeyPad;->buttonCount:I

    add-int/lit8 v7, v6, 0x1

    iput v7, v3, Lcom/beyond/screen/KeyPad;->buttonCount:I

    aput-object v0, v5, v6

    .line 315
    new-instance v5, Landroid/widget/AbsoluteLayout$LayoutParams;

    iget-object v6, v0, Lcom/beyond/screen/KeyButton;->rect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    iget-object v7, v0, Lcom/beyond/screen/KeyButton;->rect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v7

    iget-object v8, v0, Lcom/beyond/screen/KeyButton;->rect:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->left:I

    iget-object v9, v0, Lcom/beyond/screen/KeyButton;->rect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    invoke-direct {v5, v6, v7, v8, v9}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v3, v0, v5}, Lcom/beyond/screen/KeyPad;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0
.end method

.method private parseScreen(Landroid/content/Context;Lcom/beyond/screen/Screen;Lnanoxml/XMLElement;)Z
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "scr"    # Lcom/beyond/screen/Screen;
    .param p3, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 256
    const/4 v3, 0x5

    new-array v3, v3, [Lcom/beyond/screen/KeyPad;

    iput-object v3, p2, Lcom/beyond/screen/Screen;->pads:[Lcom/beyond/screen/KeyPad;

    .line 258
    invoke-virtual {p3}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v2

    .line 259
    .local v2, "v":Ljava/util/Vector;
    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_1

    .line 268
    const/4 v3, 0x1

    return v3

    .line 260
    :cond_1
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnanoxml/XMLElement;

    .line 261
    .local v0, "child":Lnanoxml/XMLElement;
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "game_window"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 262
    invoke-virtual {p0, v0}, Lcom/beyond/screen/ScreenConfig;->getRect(Lnanoxml/XMLElement;)Landroid/graphics/Rect;

    move-result-object v3

    iput-object v3, p2, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    goto :goto_0

    .line 263
    :cond_2
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "keypad"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 264
    iget-object v3, p2, Lcom/beyond/screen/Screen;->pads:[Lcom/beyond/screen/KeyPad;

    iget v4, p2, Lcom/beyond/screen/Screen;->padCount:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p2, Lcom/beyond/screen/Screen;->padCount:I

    invoke-direct {p0, p1, v0}, Lcom/beyond/screen/ScreenConfig;->parsePad(Landroid/content/Context;Lnanoxml/XMLElement;)Lcom/beyond/screen/KeyPad;

    move-result-object v5

    aput-object v5, v3, v4

    goto :goto_0
.end method

.method public static sendWipiKeyEvent(II)V
    .locals 1
    .param p0, "action"    # I
    .param p1, "key"    # I

    .prologue
    .line 352
    sget-boolean v0, Lcom/beyond/screen/ScreenConfig;->isClet:Z

    if-nez v0, :cond_0

    .line 353
    invoke-static {p0, p1}, Lcom/beyond/JletActivity;->sendWipiKeyEvent(II)V

    .line 356
    :goto_0
    return-void

    .line 355
    :cond_0
    invoke-static {p0, p1}, Lcom/beyond/CletActivity;->sendWipiKeyEvent(II)V

    goto :goto_0
.end method


# virtual methods
.method protected getAppContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 394
    sget-object v0, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    return-object v0
.end method

.method public getGameDisplayRect()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 113
    sget-object v0, Lcom/beyond/screen/ScreenConfig;->gameDisplaySize:Landroid/graphics/Rect;

    return-object v0
.end method

.method getModeByStr(Ljava/lang/String;)I
    .locals 2
    .param p1, "mode"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 163
    const-string v1, "P"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 170
    :cond_0
    :goto_0
    return v0

    .line 165
    :cond_1
    const-string v1, "L"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 166
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPlayerRect()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    iget-object v0, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method protected getRect(Lnanoxml/XMLElement;)Landroid/graphics/Rect;
    .locals 7
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 279
    const-string v4, "x"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    .line 280
    .local v2, "x":I
    const-string v4, "y"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v3

    .line 281
    .local v3, "y":I
    const-string v4, "width"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v1

    .line 282
    .local v1, "w":I
    const-string v4, "height"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    .line 283
    .local v0, "h":I
    new-instance v4, Landroid/graphics/Rect;

    add-int v5, v2, v1

    add-int v6, v3, v0

    invoke-direct {v4, v2, v3, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v4
.end method

.method public getScreenMode()I
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 174
    iget-object v2, p0, Lcom/beyond/screen/ScreenConfig;->carrier_socket:Lorg/kwis/msf/io/Socket;

    if-eqz v2, :cond_1

    .line 184
    :cond_0
    :goto_0
    return v1

    .line 176
    :cond_1
    sget-object v2, Lcom/beyond/screen/ScreenConfig;->configXml:Lnanoxml/XMLElement;

    if-eqz v2, :cond_0

    .line 179
    sget-object v2, Lcom/beyond/screen/ScreenConfig;->configXml:Lnanoxml/XMLElement;

    const-string v3, "landscape_mode"

    invoke-virtual {v2, v3}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    .line 180
    .local v0, "mode":I
    if-ne v0, v1, :cond_0

    .line 181
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public initConfig(Landroid/content/Context;Landroid/graphics/Point;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "d"    # Landroid/graphics/Point;

    .prologue
    const/4 v7, 0x0

    .line 64
    new-instance v0, Lcom/beyond/screen/ScreenConfig;

    invoke-direct {v0}, Lcom/beyond/screen/ScreenConfig;-><init>()V

    .line 66
    .local v0, "cfg":Lcom/beyond/screen/ScreenConfig;
    invoke-virtual {v0, p1}, Lcom/beyond/screen/ScreenConfig;->loadConfig(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 67
    invoke-virtual {v0}, Lcom/beyond/screen/ScreenConfig;->getScreenMode()I

    move-result v2

    iput v2, p0, Lcom/beyond/screen/ScreenConfig;->screen_cfg_mode:I

    .line 68
    new-instance v2, Lcom/beyond/screen/Screen;

    invoke-direct {v2}, Lcom/beyond/screen/Screen;-><init>()V

    iput-object v2, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    .line 69
    new-instance v2, Lcom/beyond/screen/Screen;

    invoke-direct {v2}, Lcom/beyond/screen/Screen;-><init>()V

    iput-object v2, p0, Lcom/beyond/screen/ScreenConfig;->landscapeScreen:Lcom/beyond/screen/Screen;

    .line 70
    iget-object v2, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    iget-object v3, p0, Lcom/beyond/screen/ScreenConfig;->landscapeScreen:Lcom/beyond/screen/Screen;

    invoke-virtual {v0, p1, v2, v3}, Lcom/beyond/screen/ScreenConfig;->parseScreen(Landroid/content/Context;Lcom/beyond/screen/Screen;Lcom/beyond/screen/Screen;)Z

    .line 71
    iget-object v2, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    iput-object v2, v0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    .line 80
    :goto_0
    return-void

    .line 74
    :cond_0
    const/4 v2, 0x1

    iput v2, p0, Lcom/beyond/screen/ScreenConfig;->screen_cfg_mode:I

    iput v2, v0, Lcom/beyond/screen/ScreenConfig;->screen_cfg_mode:I

    .line 75
    new-instance v2, Lcom/beyond/screen/Screen;

    invoke-direct {v2}, Lcom/beyond/screen/Screen;-><init>()V

    iput-object v2, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    iput-object v2, v0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    .line 76
    sget-object v2, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    const-string v3, "window"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 77
    .local v1, "display":Landroid/view/Display;
    iget-object v2, v0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    iget-object v3, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    new-instance v4, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v5

    invoke-virtual {v1}, Landroid/view/Display;->getHeight()I

    move-result v6

    invoke-direct {v4, v7, v7, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v4, v3, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iput-object v4, v2, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    goto :goto_0
.end method

.method public initConfig(Landroid/content/Context;Landroid/graphics/Point;Z)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "d"    # Landroid/graphics/Point;
    .param p3, "Clet"    # Z

    .prologue
    .line 83
    sput-boolean p3, Lcom/beyond/screen/ScreenConfig;->isClet:Z

    .line 84
    new-instance v0, Lcom/beyond/screen/ScreenConfig;

    invoke-direct {v0}, Lcom/beyond/screen/ScreenConfig;-><init>()V

    .line 85
    .local v0, "cfg":Lcom/beyond/screen/ScreenConfig;
    invoke-virtual {v0, p1}, Lcom/beyond/screen/ScreenConfig;->loadConfig(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 86
    invoke-virtual {v0}, Lcom/beyond/screen/ScreenConfig;->getScreenMode()I

    move-result v1

    iput v1, p0, Lcom/beyond/screen/ScreenConfig;->screen_cfg_mode:I

    .line 87
    new-instance v1, Lcom/beyond/screen/Screen;

    invoke-direct {v1}, Lcom/beyond/screen/Screen;-><init>()V

    iput-object v1, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    .line 88
    new-instance v1, Lcom/beyond/screen/Screen;

    invoke-direct {v1}, Lcom/beyond/screen/Screen;-><init>()V

    iput-object v1, p0, Lcom/beyond/screen/ScreenConfig;->landscapeScreen:Lcom/beyond/screen/Screen;

    .line 89
    iget-object v1, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    iget-object v2, p0, Lcom/beyond/screen/ScreenConfig;->landscapeScreen:Lcom/beyond/screen/Screen;

    invoke-virtual {v0, p1, v1, v2}, Lcom/beyond/screen/ScreenConfig;->parseScreen(Landroid/content/Context;Lcom/beyond/screen/Screen;Lcom/beyond/screen/Screen;)Z

    .line 97
    :goto_0
    return-void

    .line 92
    :cond_0
    const/4 v1, 0x0

    iput v1, p0, Lcom/beyond/screen/ScreenConfig;->screen_cfg_mode:I

    .line 93
    new-instance v1, Lcom/beyond/screen/Screen;

    invoke-direct {v1}, Lcom/beyond/screen/Screen;-><init>()V

    iput-object v1, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    .line 95
    iget-object v1, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    goto :goto_0
.end method

.method loadConfig(Landroid/content/Context;)Z
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 135
    const-string v3, ""

    .line 136
    .local v3, "xml":Ljava/lang/String;
    const/4 v2, 0x0

    .line 138
    .local v2, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "res_pad/screen.cfg"

    const/4 v8, 0x1

    invoke-virtual {v6, v7, v8}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v2

    .line 140
    if-nez v2, :cond_1

    .line 159
    :goto_0
    return v4

    .line 144
    :cond_0
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v6

    new-array v0, v6, [B

    .line 145
    .local v0, "b":[B
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    .line 146
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 143
    .end local v0    # "b":[B
    :cond_1
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v6

    if-gtz v6, :cond_0

    .line 148
    new-instance v6, Lnanoxml/XMLElement;

    invoke-direct {v6}, Lnanoxml/XMLElement;-><init>()V

    sput-object v6, Lcom/beyond/screen/ScreenConfig;->configXml:Lnanoxml/XMLElement;

    .line 149
    sget-object v6, Lcom/beyond/screen/ScreenConfig;->configXml:Lnanoxml/XMLElement;

    invoke-virtual {v6, v3}, Lnanoxml/XMLElement;->parseString(Ljava/lang/String;)V
    :try_end_0
    .catch Lnanoxml/XMLParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :goto_1
    move v4, v5

    .line 159
    goto :goto_0

    .line 150
    :catch_0
    move-exception v1

    .line 151
    .local v1, "e":Lnanoxml/XMLParseException;
    invoke-virtual {v1}, Lnanoxml/XMLParseException;->printStackTrace()V

    goto :goto_1

    .line 152
    .end local v1    # "e":Lnanoxml/XMLParseException;
    :catch_1
    move-exception v1

    .line 153
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public makeScreen(Landroid/view/ViewGroup;Landroid/view/View;I)V
    .locals 8
    .param p1, "vg"    # Landroid/view/ViewGroup;
    .param p2, "playView"    # Landroid/view/View;
    .param p3, "mode"    # I

    .prologue
    .line 119
    iget-object v0, p0, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    .local v0, "cur":Lcom/beyond/screen/Screen;
    if-nez v0, :cond_1

    .line 129
    :cond_0
    return-void

    .line 122
    :cond_1
    iget-object v3, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    iget-object v4, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    iget-object v5, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    iget-object v6, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p2, v3, v4, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 123
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v3, v0, Lcom/beyond/screen/Screen;->padCount:I

    if-ge v1, v3, :cond_0

    .line 124
    iget-object v3, v0, Lcom/beyond/screen/Screen;->pads:[Lcom/beyond/screen/KeyPad;

    aget-object v2, v3, v1

    .line 125
    .local v2, "pad":Lcom/beyond/screen/KeyPad;
    iget-object v3, v2, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    iget-object v4, v2, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    iget-object v5, v2, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    iget-object v6, v2, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/beyond/screen/KeyPad;->layout(IIII)V

    .line 126
    iget v3, v2, Lcom/beyond/screen/KeyPad;->bg:I

    invoke-virtual {v2, v3}, Lcom/beyond/screen/KeyPad;->setBackgroundColor(I)V

    .line 127
    new-instance v3, Landroid/widget/AbsoluteLayout$LayoutParams;

    iget-object v4, v2, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    iget-object v5, v2, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    iget-object v6, v2, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    iget-object v7, v2, Lcom/beyond/screen/KeyPad;->rect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    invoke-direct {v3, v4, v5, v6, v7}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {p1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method parseScreen(Landroid/content/Context;Lcom/beyond/screen/Screen;Lcom/beyond/screen/Screen;)Z
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "scr_p"    # Lcom/beyond/screen/Screen;
    .param p3, "scr_l"    # Lcom/beyond/screen/Screen;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 191
    sget-object v5, Lcom/beyond/screen/ScreenConfig;->configXml:Lnanoxml/XMLElement;

    invoke-virtual {v5}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v4

    .line 192
    .local v4, "v":Ljava/util/Vector;
    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_2

    .line 212
    iget-object v5, p2, Lcom/beyond/screen/Screen;->pads:[Lcom/beyond/screen/KeyPad;

    if-nez v5, :cond_1

    iget-object v5, p2, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    if-nez v5, :cond_1

    .line 214
    sget-boolean v5, Lcom/beyond/screen/ScreenConfig;->isClet:Z

    if-nez v5, :cond_7

    .line 215
    sget-object v5, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    const-string v6, "window"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/WindowManager;

    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 220
    .local v1, "display":Landroid/view/Display;
    :goto_1
    invoke-virtual {p0}, Lcom/beyond/screen/ScreenConfig;->getScreenMode()I

    move-result v5

    if-ne v5, v9, :cond_8

    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v5

    invoke-virtual {v1}, Landroid/view/Display;->getHeight()I

    move-result v6

    if-le v5, v6, :cond_8

    .line 222
    new-instance v5, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/view/Display;->getHeight()I

    move-result v6

    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v7

    invoke-direct {v5, v8, v8, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v5, p2, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    .line 225
    :goto_2
    iget-object v5, p2, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    const/16 v6, 0x320

    if-ne v5, v6, :cond_1

    iget-object v5, p2, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    const/16 v6, 0x500

    if-ne v5, v6, :cond_1

    .line 227
    iget-object v5, p2, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v6, v5, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v6, v6, -0x2a

    iput v6, v5, Landroid/graphics/Rect;->bottom:I

    .line 232
    .end local v1    # "display":Landroid/view/Display;
    :cond_1
    sget-object v5, Lcom/beyond/screen/ScreenConfig;->configXml:Lnanoxml/XMLElement;

    const-string v6, "net_bill_type"

    invoke-virtual {v5, v6}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v5

    sput v5, Lcom/beyond/io/ConnectionFactory;->net_bill_type:I

    .line 234
    return v9

    .line 193
    :cond_2
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnanoxml/XMLElement;

    .line 194
    .local v2, "el":Lnanoxml/XMLElement;
    invoke-virtual {v2}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "game_display_size"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 195
    invoke-virtual {p0, v2}, Lcom/beyond/screen/ScreenConfig;->getRect(Lnanoxml/XMLElement;)Landroid/graphics/Rect;

    move-result-object v5

    sput-object v5, Lcom/beyond/screen/ScreenConfig;->gameDisplaySize:Landroid/graphics/Rect;

    goto :goto_0

    .line 197
    :cond_3
    invoke-virtual {v2}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "wipi_annun_area"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 198
    sget-object v5, Lcom/beyond/screen/ScreenConfig;->annun_info:Lcom/beyond/screen/AnnunInfo;

    invoke-direct {p0, v5, v2}, Lcom/beyond/screen/ScreenConfig;->parseAnnun(Lcom/beyond/screen/AnnunInfo;Lnanoxml/XMLElement;)V

    goto/16 :goto_0

    .line 200
    :cond_4
    invoke-virtual {v2}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "screen"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 201
    const-string v5, "value"

    invoke-virtual {v2, v5}, Lnanoxml/XMLElement;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 202
    .local v0, "attr":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/beyond/screen/ScreenConfig;->getModeByStr(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v9, :cond_5

    .line 203
    invoke-direct {p0, p1, p2, v2}, Lcom/beyond/screen/ScreenConfig;->parseScreen(Landroid/content/Context;Lcom/beyond/screen/Screen;Lnanoxml/XMLElement;)Z

    goto/16 :goto_0

    .line 204
    :cond_5
    invoke-virtual {p0, v0}, Lcom/beyond/screen/ScreenConfig;->getModeByStr(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_0

    .line 205
    invoke-direct {p0, p1, p3, v2}, Lcom/beyond/screen/ScreenConfig;->parseScreen(Landroid/content/Context;Lcom/beyond/screen/Screen;Lnanoxml/XMLElement;)Z

    goto/16 :goto_0

    .line 207
    .end local v0    # "attr":Ljava/lang/String;
    :cond_6
    invoke-virtual {v2}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "font"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 208
    invoke-direct {p0, v2}, Lcom/beyond/screen/ScreenConfig;->parseFont(Lnanoxml/XMLElement;)V

    goto/16 :goto_0

    .line 217
    .end local v2    # "el":Lnanoxml/XMLElement;
    :cond_7
    sget-object v5, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    const-string v6, "window"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/WindowManager;

    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .restart local v1    # "display":Landroid/view/Display;
    goto/16 :goto_1

    .line 224
    :cond_8
    new-instance v5, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v6

    invoke-virtual {v1}, Landroid/view/Display;->getHeight()I

    move-result v7

    invoke-direct {v5, v8, v8, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v5, p2, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    goto/16 :goto_2
.end method

.method public runCheck(Ljava/lang/String;)V
    .locals 0
    .param p1, "appID"    # Ljava/lang/String;

    .prologue
    .line 400
    return-void
.end method

.method public sendMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 390
    invoke-static {}, Lcom/beyond/BeyondActivity;->getHandler2()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 391
    return-void
.end method

.method public showAnnunciator()V
    .locals 0

    .prologue
    .line 360
    return-void
.end method

.method public showDlg(Ljava/lang/String;Ljava/lang/String;ILandroid/content/DialogInterface$OnClickListener;)I
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "contents"    # Ljava/lang/String;
    .param p3, "type"    # I
    .param p4, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 367
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/beyond/BeyondActivity;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 368
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 369
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 370
    const/16 v1, 0xb

    if-ne p3, v1, :cond_0

    .line 372
    const-string v1, "OK"

    invoke-virtual {v0, v1, p4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 384
    :goto_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 385
    const/4 v1, 0x0

    return v1

    .line 375
    :cond_0
    const-string v1, "locale"

    invoke-static {v1}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ko"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 376
    const-string v1, "\ud655\uc778"

    invoke-virtual {v0, v1, p4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 377
    const-string v1, "\ucde8\uc18c"

    invoke-virtual {v0, v1, p4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 380
    :cond_1
    const-string v1, "OK"

    invoke-virtual {v0, v1, p4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 381
    const-string v1, "CANCEL"

    invoke-virtual {v0, v1, p4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0
.end method
