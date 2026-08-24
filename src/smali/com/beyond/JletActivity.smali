.class public Lcom/beyond/JletActivity;
.super Lcom/beyond/BeyondActivity;
.source "JletActivity.java"


# static fields
.field public static view:Lcom/beyond/JletView;

.field static x:I

.field static y:I

.field private static zipIo:Lcom/beyond/ZipIo;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 44
    const/4 v0, 0x0

    sput-object v0, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    .line 248
    new-instance v0, Lcom/beyond/ZipIo;

    invoke-direct {v0}, Lcom/beyond/ZipIo;-><init>()V

    sput-object v0, Lcom/beyond/JletActivity;->zipIo:Lcom/beyond/ZipIo;

    .line 329
    sput v1, Lcom/beyond/JletActivity;->x:I

    .line 330
    sput v1, Lcom/beyond/JletActivity;->y:I

    .line 41
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/beyond/BeyondActivity;-><init>()V

    return-void
.end method

.method private createStarter()V
    .locals 12

    .prologue
    const/4 v11, 0x1

    .line 83
    sget-object v4, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    if-eqz v4, :cond_0

    .line 85
    :try_start_0
    const-string v4, "com.kt.ScreenConfig"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 86
    .local v2, "justclass":Ljava/lang/Class;
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/beyond/screen/ScreenConfig;

    iput-object v4, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .end local v2    # "justclass":Ljava/lang/Class;
    :goto_0
    sget-object v4, Lcom/beyond/JletActivity;->carrier:Ljava/lang/String;

    const-string v5, "KT"

    invoke-virtual {v4, v5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_1

    .line 92
    invoke-virtual {p0, v11}, Lcom/beyond/JletActivity;->setRequestedOrientation(I)V

    .line 93
    invoke-static {}, Lcom/kt/KafBridge;->getInitError()I

    move-result v4

    if-eqz v4, :cond_1

    .line 147
    :goto_1
    return-void

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 98
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    new-instance v4, Lcom/beyond/screen/ScreenConfig;

    invoke-direct {v4}, Lcom/beyond/screen/ScreenConfig;-><init>()V

    iput-object v4, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    .line 99
    iget-object v4, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    new-instance v5, Landroid/graphics/Point;

    sget-object v6, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getWidth()I

    move-result v6

    sget-object v7, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    invoke-virtual {v7}, Landroid/view/ViewGroup;->getHeight()I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/graphics/Point;-><init>(II)V

    invoke-virtual {v4, p0, v5}, Lcom/beyond/screen/ScreenConfig;->initConfig(Landroid/content/Context;Landroid/graphics/Point;)V

    .line 100
    iget-object v4, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v4}, Lcom/beyond/screen/ScreenConfig;->getScreenMode()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/beyond/JletActivity;->setRequestedOrientation(I)V

    .line 103
    :cond_1
    new-instance v4, Lcom/beyond/JletView;

    invoke-direct {v4, p0}, Lcom/beyond/JletView;-><init>(Landroid/content/Context;)V

    sput-object v4, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    .line 104
    iget-object v4, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v4}, Lcom/beyond/screen/ScreenConfig;->getPlayerRect()Landroid/graphics/Rect;

    move-result-object v3

    .line 107
    .local v3, "playerRect":Landroid/graphics/Rect;
    if-nez v3, :cond_5

    .line 108
    sget-object v4, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    invoke-virtual {p0, v4}, Lcom/beyond/JletActivity;->setContentView(Landroid/view/View;)V

    .line 125
    :goto_2
    const-string v4, "use_hd_keypad"

    invoke-static {v4}, Lcom/beyond/AppProperty;->getInt(Ljava/lang/String;)I

    move-result v4

    if-eq v4, v11, :cond_2

    sget-object v4, Lcom/beyond/JletActivity;->carrier:Ljava/lang/String;

    const-string v5, "KT"

    invoke-virtual {v4, v5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_3

    .line 126
    :cond_2
    new-instance v4, Lcom/beyond/InputBox;

    sget-object v5, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/beyond/InputBox;-><init>(Landroid/content/Context;)V

    sput-object v4, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    .line 127
    sget-object v4, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    sget-object v5, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 128
    sget-object v4, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    const-string v5, ""

    invoke-virtual {v4, v5}, Lcom/beyond/InputBox;->setText(Ljava/lang/CharSequence;)V

    .line 130
    sget-object v4, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    invoke-virtual {v4}, Lcom/beyond/InputBox;->clearFocus()V

    .line 141
    :cond_3
    const-string v4, "main_class"

    invoke-static {v4}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/JletActivity;->main_class:Ljava/lang/String;

    .line 142
    iget-object v4, p0, Lcom/beyond/JletActivity;->main_class:Ljava/lang/String;

    if-nez v4, :cond_4

    .line 143
    invoke-virtual {p0}, Lcom/beyond/JletActivity;->getMainClass()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/JletActivity;->main_class:Ljava/lang/String;

    .line 144
    :cond_4
    new-instance v4, Lcom/beyond/MainLoop;

    iget-object v5, p0, Lcom/beyond/JletActivity;->main_class:Ljava/lang/String;

    invoke-direct {v4, v5}, Lcom/beyond/MainLoop;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/beyond/MainLoop;->start()V

    goto/16 :goto_1

    .line 111
    :cond_5
    iget-object v4, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v4}, Lcom/beyond/screen/ScreenConfig;->getGameDisplayRect()Landroid/graphics/Rect;

    move-result-object v1

    .line 112
    .local v1, "gameDisplayRect":Landroid/graphics/Rect;
    if-nez v1, :cond_6

    .line 113
    new-instance v4, Landroid/graphics/Point;

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v5

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/graphics/Point;-><init>(II)V

    sput-object v4, Lcom/beyond/JletActivity;->gameDisplaySize:Landroid/graphics/Point;

    .line 120
    :goto_3
    sget-object v4, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    sget-object v5, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    new-instance v6, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v7

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v8

    iget v9, v3, Landroid/graphics/Rect;->left:I

    iget v10, v3, Landroid/graphics/Rect;->top:I

    invoke-direct {v6, v7, v8, v9, v10}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v4, v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    iget-object v4, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    sget-object v5, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    sget-object v6, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    const/4 v7, -0x1

    invoke-virtual {v4, v5, v6, v7}, Lcom/beyond/screen/ScreenConfig;->makeScreen(Landroid/view/ViewGroup;Landroid/view/View;I)V

    goto/16 :goto_2

    .line 116
    :cond_6
    new-instance v4, Landroid/graphics/Point;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/graphics/Point;-><init>(II)V

    sput-object v4, Lcom/beyond/JletActivity;->gameDisplaySize:Landroid/graphics/Point;

    .line 117
    sget-object v4, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v6, v7

    invoke-virtual {v4, v5, v6}, Lcom/beyond/JletView;->setScaleRatio(FF)V

    goto :goto_3
.end method

.method private createStarter(Ljava/lang/String;)V
    .locals 3
    .param p1, "appID"    # Ljava/lang/String;

    .prologue
    .line 74
    :try_start_0
    const-string v2, "com.skt.ScreenConfig"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 75
    .local v1, "justclass":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v2, p1}, Lcom/beyond/screen/ScreenConfig;->runCheck(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .end local v1    # "justclass":Ljava/lang/Class;
    :goto_0
    return-void

    .line 77
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static findRawResouce(Ljava/lang/String;)I
    .locals 5
    .param p0, "fname"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 427
    const-string v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 428
    .local v1, "separatorIndex":I
    if-gez v1, :cond_1

    .line 429
    :goto_0
    const-string v2, "."

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 430
    if-gez v1, :cond_2

    .line 431
    :goto_1
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_3

    .line 440
    :cond_0
    :goto_2
    return v0

    .line 428
    :cond_1
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 430
    :cond_2
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 433
    :cond_3
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x30

    if-lt v2, v3, :cond_4

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x39

    if-gt v2, v3, :cond_4

    .line 434
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "m"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 435
    :cond_4
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x53

    if-ne v2, v3, :cond_5

    .line 436
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "s"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 437
    :cond_5
    sget-object v2, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "raw"

    sget-object v4, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, p0, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 440
    .local v0, "res_id":I
    goto :goto_2
.end method

.method public static getCurrentJlet()Lcom/beyond/JletBridge;
    .locals 1

    .prologue
    .line 222
    sget-object v0, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    return-object v0
.end method

.method static getDefaultDisplay()Landroid/view/Display;
    .locals 1

    .prologue
    .line 292
    invoke-static {}, Lcom/beyond/JletActivity;->getWinManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    return-object v0
.end method

.method static getGameDisplaySize()Landroid/graphics/Point;
    .locals 3

    .prologue
    .line 214
    sget-object v0, Lcom/beyond/JletActivity;->gameDisplaySize:Landroid/graphics/Point;

    if-nez v0, :cond_0

    .line 215
    new-instance v0, Landroid/graphics/Point;

    sget-object v1, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    invoke-virtual {v1}, Lcom/beyond/JletView;->getWidth()I

    move-result v1

    sget-object v2, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    invoke-virtual {v2}, Lcom/beyond/JletView;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    sput-object v0, Lcom/beyond/JletActivity;->gameDisplaySize:Landroid/graphics/Point;

    .line 216
    :cond_0
    sget-object v0, Lcom/beyond/JletActivity;->gameDisplaySize:Landroid/graphics/Point;

    return-object v0
.end method

.method public static getInputBox()Landroid/view/View;
    .locals 1

    .prologue
    .line 455
    sget-object v0, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    return-object v0
.end method

.method private static getMainClassFromConfg()Ljava/lang/String;
    .locals 2

    .prologue
    .line 227
    :try_start_0
    const-string v1, "com.beyond.Main"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    .line 228
    .local v0, "obj":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 232
    :goto_0
    return-object v1

    .line 230
    :catch_0
    move-exception v1

    .line 232
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getResource(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 5
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 251
    sget-object v3, Lcom/beyond/JletActivity;->zipIo:Lcom/beyond/ZipIo;

    sget-object v4, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v3, v4, p0}, Lcom/beyond/ZipIo;->getInputStream(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 252
    .local v1, "is":Ljava/io/InputStream;
    if-eqz v1, :cond_0

    .line 263
    .end local v1    # "is":Ljava/io/InputStream;
    :goto_0
    return-object v1

    .line 255
    .restart local v1    # "is":Ljava/io/InputStream;
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/beyond/JletActivity;->findRawResouce(Ljava/lang/String;)I

    move-result v2

    .line 256
    .local v2, "res_id":I
    if-eqz v2, :cond_1

    .line 257
    sget-object v3, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1

    goto :goto_0

    .line 259
    :cond_1
    sget-object v3, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 260
    .end local v2    # "res_id":I
    :catch_0
    move-exception v0

    .line 261
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 263
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getWinManager()Landroid/view/WindowManager;
    .locals 1

    .prologue
    .line 288
    sget-object v0, Lcom/beyond/JletActivity;->instance:Lcom/beyond/BeyondActivity;

    invoke-virtual {v0}, Lcom/beyond/BeyondActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    return-object v0
.end method

.method public static sendWipiKeyEvent(II)V
    .locals 3
    .param p0, "action"    # I
    .param p1, "key"    # I

    .prologue
    const/4 v2, 0x1

    .line 321
    const/4 v1, 0x4

    new-array v0, v1, [I

    .line 322
    .local v0, "evt":[I
    const/4 v1, 0x0

    aput v2, v0, v1

    .line 323
    aput p0, v0, v2

    .line 324
    const/4 v1, 0x2

    aput p1, v0, v1

    .line 326
    sget-object v1, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v1, v0}, Lcom/beyond/JletBridge;->postEvent([I)Z

    .line 327
    return-void
.end method

.method private showExitDlg()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 460
    const-string v0, "locale"

    invoke-static {v0}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ko"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 461
    iget-object v0, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    const-string v1, "\uc885\ub8cc"

    const-string v2, "\uc885\ub8cc\ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c ?"

    new-instance v3, Lcom/beyond/JletActivity$1;

    invoke-direct {v3, p0}, Lcom/beyond/JletActivity$1;-><init>(Lcom/beyond/JletActivity;)V

    invoke-virtual {v0, v1, v2, v4, v3}, Lcom/beyond/screen/ScreenConfig;->showDlg(Ljava/lang/String;Ljava/lang/String;ILandroid/content/DialogInterface$OnClickListener;)I

    .line 482
    :goto_0
    return-void

    .line 472
    :cond_0
    iget-object v0, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    const-string v1, "Exit"

    const-string v2, "Are you sure to Exit?"

    new-instance v3, Lcom/beyond/JletActivity$2;

    invoke-direct {v3, p0}, Lcom/beyond/JletActivity$2;-><init>(Lcom/beyond/JletActivity;)V

    invoke-virtual {v0, v1, v2, v4, v3}, Lcom/beyond/screen/ScreenConfig;->showDlg(Ljava/lang/String;Ljava/lang/String;ILandroid/content/DialogInterface$OnClickListener;)I

    goto :goto_0
.end method

.method private test_sensor(I)Z
    .locals 5
    .param p1, "key"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 332
    packed-switch p1, :pswitch_data_0

    .line 355
    :goto_0
    return v1

    .line 334
    :pswitch_0
    sget v3, Lcom/beyond/JletActivity;->x:I

    add-int/lit8 v3, v3, -0x1

    sput v3, Lcom/beyond/JletActivity;->x:I

    .line 348
    :goto_1
    const/4 v3, 0x4

    new-array v0, v3, [I

    .line 349
    .local v0, "evt":[I
    const/16 v3, 0x9

    aput v3, v0, v1

    .line 350
    sget v3, Lcom/beyond/JletActivity;->x:I

    aput v3, v0, v2

    .line 351
    const/4 v3, 0x2

    sget v4, Lcom/beyond/JletActivity;->y:I

    aput v4, v0, v3

    .line 352
    const/4 v3, 0x3

    aput v1, v0, v3

    .line 354
    sget-object v1, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v1, v0}, Lcom/beyond/JletBridge;->postEvent([I)Z

    move v1, v2

    .line 355
    goto :goto_0

    .line 337
    .end local v0    # "evt":[I
    :pswitch_1
    sget v3, Lcom/beyond/JletActivity;->x:I

    add-int/lit8 v3, v3, 0x1

    sput v3, Lcom/beyond/JletActivity;->x:I

    goto :goto_1

    .line 340
    :pswitch_2
    sget v3, Lcom/beyond/JletActivity;->y:I

    add-int/lit8 v3, v3, 0x32

    sput v3, Lcom/beyond/JletActivity;->y:I

    goto :goto_1

    .line 343
    :pswitch_3
    sget v3, Lcom/beyond/JletActivity;->y:I

    add-int/lit8 v3, v3, -0x32

    sput v3, Lcom/beyond/JletActivity;->y:I

    goto :goto_1

    .line 332
    nop

    :pswitch_data_0
    .packed-switch -0x4
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public appStart()V
    .locals 9

    .prologue
    .line 150
    new-instance v2, Lcom/beyond/screen/ScreenConfig;

    invoke-direct {v2}, Lcom/beyond/screen/ScreenConfig;-><init>()V

    iput-object v2, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    .line 151
    iget-object v2, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    new-instance v3, Landroid/graphics/Point;

    sget-object v4, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getWidth()I

    move-result v4

    sget-object v5, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getHeight()I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/graphics/Point;-><init>(II)V

    invoke-virtual {v2, p0, v3}, Lcom/beyond/screen/ScreenConfig;->initConfig(Landroid/content/Context;Landroid/graphics/Point;)V

    .line 152
    iget-object v2, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v2}, Lcom/beyond/screen/ScreenConfig;->getScreenMode()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/beyond/JletActivity;->setRequestedOrientation(I)V

    .line 154
    new-instance v2, Lcom/beyond/JletView;

    invoke-direct {v2, p0}, Lcom/beyond/JletView;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    .line 155
    iget-object v2, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v2}, Lcom/beyond/screen/ScreenConfig;->getPlayerRect()Landroid/graphics/Rect;

    move-result-object v1

    .line 158
    .local v1, "playerRect":Landroid/graphics/Rect;
    if-nez v1, :cond_3

    .line 159
    sget-object v2, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    invoke-virtual {p0, v2}, Lcom/beyond/JletActivity;->setContentView(Landroid/view/View;)V

    .line 176
    :goto_0
    const-string v2, "use_hd_keypad"

    invoke-static {v2}, Lcom/beyond/AppProperty;->getInt(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_0

    sget-object v2, Lcom/beyond/JletActivity;->carrier:Ljava/lang/String;

    const-string v3, "KT"

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_1

    .line 177
    :cond_0
    new-instance v2, Lcom/beyond/InputBox;

    sget-object v3, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/beyond/InputBox;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    .line 178
    sget-object v2, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    sget-object v3, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 179
    sget-object v2, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    const-string v3, ""

    invoke-virtual {v2, v3}, Lcom/beyond/InputBox;->setText(Ljava/lang/CharSequence;)V

    .line 181
    sget-object v2, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    invoke-virtual {v2}, Lcom/beyond/InputBox;->clearFocus()V

    .line 192
    :cond_1
    const-string v2, "main_class"

    invoke-static {v2}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/beyond/JletActivity;->main_class:Ljava/lang/String;

    .line 193
    iget-object v2, p0, Lcom/beyond/JletActivity;->main_class:Ljava/lang/String;

    if-nez v2, :cond_2

    .line 194
    invoke-virtual {p0}, Lcom/beyond/JletActivity;->getMainClass()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/beyond/JletActivity;->main_class:Ljava/lang/String;

    .line 195
    :cond_2
    new-instance v2, Lcom/beyond/MainLoop;

    iget-object v3, p0, Lcom/beyond/JletActivity;->main_class:Ljava/lang/String;

    invoke-direct {v2, v3}, Lcom/beyond/MainLoop;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/beyond/MainLoop;->start()V

    .line 198
    return-void

    .line 162
    :cond_3
    iget-object v2, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v2}, Lcom/beyond/screen/ScreenConfig;->getGameDisplayRect()Landroid/graphics/Rect;

    move-result-object v0

    .line 163
    .local v0, "gameDisplayRect":Landroid/graphics/Rect;
    if-nez v0, :cond_4

    .line 164
    new-instance v2, Landroid/graphics/Point;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    sput-object v2, Lcom/beyond/JletActivity;->gameDisplaySize:Landroid/graphics/Point;

    .line 171
    :goto_1
    sget-object v2, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    sget-object v3, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    new-instance v4, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v6

    iget v7, v1, Landroid/graphics/Rect;->left:I

    iget v8, v1, Landroid/graphics/Rect;->top:I

    invoke-direct {v4, v5, v6, v7, v8}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v2, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    iget-object v2, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    sget-object v3, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    sget-object v4, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    const/4 v5, -0x1

    invoke-virtual {v2, v3, v4, v5}, Lcom/beyond/screen/ScreenConfig;->makeScreen(Landroid/view/ViewGroup;Landroid/view/View;I)V

    goto/16 :goto_0

    .line 167
    :cond_4
    new-instance v2, Landroid/graphics/Point;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    sput-object v2, Lcom/beyond/JletActivity;->gameDisplaySize:Landroid/graphics/Point;

    .line 168
    sget-object v2, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/beyond/JletView;->setScaleRatio(FF)V

    goto :goto_1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 6
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 360
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/beyond/JletActivity;->getWipiKeyCode(I)I

    move-result v1

    .line 361
    .local v1, "key":I
    if-nez v1, :cond_1

    .line 422
    :cond_0
    :goto_0
    return v2

    .line 364
    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    const/16 v5, 0x42

    if-ne v4, v5, :cond_2

    .line 365
    sget-object v4, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    iget-object v4, v4, Lcom/beyond/InputBox;->objListener:Lcom/beyond/util/ObjectListener;

    if-eqz v4, :cond_2

    .line 366
    sget-object v2, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    invoke-virtual {v2}, Lcom/beyond/InputBox;->onPressEnter()V

    move v2, v3

    .line 367
    goto :goto_0

    .line 371
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    const/4 v5, 0x4

    if-ne v4, v5, :cond_5

    .line 372
    sget-object v4, Lcom/beyond/JletActivity;->carrier:Ljava/lang/String;

    const-string v5, "KT"

    invoke-virtual {v4, v5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_4

    .line 373
    sget-object v2, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    if-eqz v2, :cond_3

    .line 374
    sget-object v2, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v2}, Lcom/beyond/JletBridge;->notifyPaused()V

    .line 375
    :cond_3
    invoke-direct {p0}, Lcom/beyond/JletActivity;->showExitDlg()V

    move v2, v3

    .line 377
    goto :goto_0

    .line 379
    :cond_4
    sget v4, Lcom/beyond/JletActivity;->logoState:I

    if-eqz v4, :cond_7

    .line 380
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    .line 400
    :cond_5
    sget-object v4, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    if-eqz v4, :cond_6

    sget-object v4, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    iget-object v4, v4, Lcom/beyond/InputBox;->objListener:Lcom/beyond/util/ObjectListener;

    if-eqz v4, :cond_6

    .line 401
    invoke-super {p0, p1}, Lcom/beyond/BeyondActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 403
    :cond_6
    sget v4, Lcom/beyond/JletActivity;->logoState:I

    if-eqz v4, :cond_8

    move v2, v3

    .line 404
    goto :goto_0

    .line 384
    :cond_7
    sget-boolean v4, Lcom/beyond/JletActivity;->isAppHandleReturnKey:Z

    if-nez v4, :cond_5

    .line 385
    invoke-direct {p0}, Lcom/beyond/JletActivity;->showExitDlg()V

    move v2, v3

    .line 387
    goto :goto_0

    .line 407
    :cond_8
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/beyond/JletActivity;->getWipiKeyEvent(I)I

    move-result v0

    .line 408
    .local v0, "action":I
    if-ltz v0, :cond_0

    .line 418
    invoke-static {v0, v1}, Lcom/beyond/JletActivity;->sendWipiKeyEvent(II)V

    .line 420
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    const/16 v5, 0x19

    if-eq v4, v5, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    const/16 v5, 0x18

    if-eq v4, v5, :cond_0

    move v2, v3

    .line 422
    goto :goto_0
.end method

.method protected getMainClass()Ljava/lang/String;
    .locals 6

    .prologue
    .line 238
    invoke-virtual {p0}, Lcom/beyond/JletActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "main_class"

    const-string v4, "string"

    invoke-virtual {p0}, Lcom/beyond/JletActivity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 239
    .local v0, "id":I
    if-nez v0, :cond_0

    .line 240
    invoke-static {}, Lcom/beyond/JletActivity;->getMainClassFromConfg()Ljava/lang/String;

    move-result-object v1

    .line 241
    .local v1, "str":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 245
    .end local v1    # "str":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0}, Lcom/beyond/JletActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected onAppPause()V
    .locals 1

    .prologue
    .line 275
    sget-object v0, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    if-eqz v0, :cond_0

    .line 276
    sget-object v0, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v0}, Lcom/beyond/JletBridge;->notifyPaused()V

    .line 277
    :cond_0
    return-void
.end method

.method protected onAppResume()V
    .locals 1

    .prologue
    .line 280
    sget-object v0, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v0}, Lcom/beyond/JletBridge;->requestResumed()V

    .line 281
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 49
    sput-object p0, Lcom/beyond/JletActivity;->instance:Lcom/beyond/BeyondActivity;

    .line 52
    invoke-super {p0, p1}, Lcom/beyond/BeyondActivity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    invoke-direct {p0}, Lcom/beyond/JletActivity;->createStarter()V

    .line 54
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .param p2, "appID"    # Ljava/lang/String;

    .prologue
    .line 57
    sput-object p0, Lcom/beyond/JletActivity;->instance:Lcom/beyond/BeyondActivity;

    .line 60
    invoke-super {p0, p1}, Lcom/beyond/BeyondActivity;->onCreate(Landroid/os/Bundle;)V

    .line 61
    invoke-direct {p0, p2}, Lcom/beyond/JletActivity;->createStarter(Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method protected onRetryKafInit(Ljava/lang/Object;)V
    .locals 1
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    .line 65
    move-object v0, p1

    check-cast v0, Landroid/app/ProgressDialog;

    .line 66
    .local v0, "pd":Landroid/app/ProgressDialog;
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 67
    invoke-direct {p0}, Lcom/beyond/JletActivity;->createStarter()V

    .line 68
    return-void
.end method

.method protected onShowAnnun()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 296
    iget-object v4, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    iget-object v0, v4, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    .line 297
    .local v0, "cur":Lcom/beyond/screen/Screen;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v4, v0, Lcom/beyond/screen/Screen;->padCount:I

    if-lt v1, v4, :cond_0

    .line 302
    iget-object v4, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v4}, Lcom/beyond/screen/ScreenConfig;->showAnnunciator()V

    .line 304
    iget-object v4, p0, Lcom/beyond/JletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    iget-object v0, v4, Lcom/beyond/screen/ScreenConfig;->portraitScreen:Lcom/beyond/screen/Screen;

    .line 305
    sget-object v3, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    .line 306
    .local v3, "v":Lcom/beyond/JletView;
    iget-object v4, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    iget-object v5, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    iget-object v6, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    iget-object v7, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/beyond/JletView;->layout(IIII)V

    .line 307
    sget-object v4, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 308
    sget-object v4, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    new-instance v5, Landroid/widget/AbsoluteLayout$LayoutParams;

    iget-object v6, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    iget-object v7, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v7

    iget-object v8, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->left:I

    iget-object v9, v0, Lcom/beyond/screen/Screen;->playerRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    invoke-direct {v5, v6, v7, v8, v9}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v4, v3, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 311
    const/4 v1, 0x0

    :goto_1
    iget v4, v0, Lcom/beyond/screen/Screen;->padCount:I

    if-lt v1, v4, :cond_1

    .line 317
    sget-object v4, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    invoke-virtual {v4}, Lcom/beyond/JletView;->invalidate()V

    .line 318
    return-void

    .line 298
    .end local v3    # "v":Lcom/beyond/JletView;
    :cond_0
    iget-object v4, v0, Lcom/beyond/screen/Screen;->pads:[Lcom/beyond/screen/KeyPad;

    aget-object v2, v4, v1

    .line 299
    .local v2, "pad":Lcom/beyond/screen/KeyPad;
    sget-object v4, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 297
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 312
    .end local v2    # "pad":Lcom/beyond/screen/KeyPad;
    .restart local v3    # "v":Lcom/beyond/JletView;
    :cond_1
    iget-object v4, v0, Lcom/beyond/screen/Screen;->pads:[Lcom/beyond/screen/KeyPad;

    aget-object v2, v4, v1

    .line 313
    .restart local v2    # "pad":Lcom/beyond/screen/KeyPad;
    invoke-virtual {v2}, Lcom/beyond/screen/KeyPad;->getRect()Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    invoke-virtual {v2}, Lcom/beyond/screen/KeyPad;->getRect()Landroid/graphics/Rect;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Rect;->top:I

    invoke-virtual {v2}, Lcom/beyond/screen/KeyPad;->getRect()Landroid/graphics/Rect;

    move-result-object v6

    iget v6, v6, Landroid/graphics/Rect;->right:I

    invoke-virtual {v2}, Lcom/beyond/screen/KeyPad;->getRect()Landroid/graphics/Rect;

    move-result-object v7

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v2, v4, v5, v6, v7}, Lcom/beyond/screen/KeyPad;->layout(IIII)V

    .line 314
    invoke-static {v10, v10, v10}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/beyond/screen/KeyPad;->setBackgroundColor(I)V

    .line 315
    sget-object v4, Lcom/beyond/JletActivity;->vg:Landroid/view/ViewGroup;

    new-instance v5, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {v2}, Lcom/beyond/screen/KeyPad;->getRect()Landroid/graphics/Rect;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    invoke-virtual {v2}, Lcom/beyond/screen/KeyPad;->getRect()Landroid/graphics/Rect;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v7

    invoke-virtual {v2}, Lcom/beyond/screen/KeyPad;->getRect()Landroid/graphics/Rect;

    move-result-object v8

    iget v8, v8, Landroid/graphics/Rect;->left:I

    invoke-virtual {v2}, Lcom/beyond/screen/KeyPad;->getRect()Landroid/graphics/Rect;

    move-result-object v9

    iget v9, v9, Landroid/graphics/Rect;->top:I

    invoke-direct {v5, v6, v7, v8, v9}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v4, v2, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 311
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 284
    invoke-super {p0}, Lcom/beyond/BeyondActivity;->onStop()V

    .line 285
    return-void
.end method
