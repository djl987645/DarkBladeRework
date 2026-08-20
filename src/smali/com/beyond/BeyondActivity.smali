.class public Lcom/beyond/BeyondActivity;
.super Lcom/beyond/KTPurchaseActivity;
.source "BeyondActivity.java"


# static fields
.field public static final ADD_AD:I = 0xc8

.field public static final ALLLOGO_COMPLETED:I = 0x0

.field public static final APP_START:I = 0x1f5

.field public static final BEYONDLOGO_WAITING:I = 0x2

.field public static CONFIG_BUILD_SDK:Z = false

.field public static final EDIT_SETPOSITION:I = 0x66

.field public static final EDIT_SETTEXT:I = 0x65

.field public static final EDIT_SHOWSWIP:I = 0x67

.field public static final EXIT_ACTIVITY:I = 0x1bc

.field public static final HIDE_AD:I = 0xd3

.field public static final MESSAGE:I = 0x12c

.field public static final REMOVE_AD:I = 0xc9

.field public static final RETRY_KAFINIT:I = 0x1bd

.field public static final RIGHTLOGO_WAITING:I = 0x1

.field public static final SHOWANNUN:I = 0x78

.field public static final SHOW_AD:I = 0xd2

.field public static final SHOW_DIALOG:I = 0xdc

.field public static final SHOW_TOAST:I = 0x3e6

.field public static final SOCKET_CONNECT:I = 0x3e8

.field public static final TEST_MSG:I = 0x3e7

.field static app:Lcom/beyond/JletBridge;

.field static carrier:Ljava/lang/String;

.field static config:Landroid/content/res/Configuration;

.field public static context:Landroid/content/Context;

.field protected static gameDisplaySize:Landroid/graphics/Point;

.field protected static handler:Landroid/os/Handler;

.field static instance:Lcom/beyond/BeyondActivity;

.field static isAppCreaed:Z

.field static isAppHandleReturnKey:Z

.field static isAppHandleSIDEKey:Z

.field static jf:Lcom/beyond/InputBox;

.field static logoState:I

.field static randomKey:I

.field static restDays:I

.field static vg:Landroid/view/ViewGroup;


# instance fields
.field private mSensor:Lcom/beyond/Sensor;

.field protected mSensorManager:Landroid/hardware/SensorManager;

.field private mViewWeb:Landroid/webkit/WebView;

.field main_class:Ljava/lang/String;

.field protected scrConfig:Lcom/beyond/screen/ScreenConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 54
    sput-boolean v1, Lcom/beyond/BeyondActivity;->CONFIG_BUILD_SDK:Z

    .line 59
    sput v1, Lcom/beyond/BeyondActivity;->logoState:I

    .line 60
    sput v1, Lcom/beyond/BeyondActivity;->randomKey:I

    .line 61
    sput v1, Lcom/beyond/BeyondActivity;->restDays:I

    .line 63
    sput-object v0, Lcom/beyond/BeyondActivity;->app:Lcom/beyond/JletBridge;

    .line 65
    sput-object v0, Lcom/beyond/BeyondActivity;->context:Landroid/content/Context;

    .line 67
    sput-boolean v1, Lcom/beyond/BeyondActivity;->isAppCreaed:Z

    .line 68
    sput-object v0, Lcom/beyond/BeyondActivity;->config:Landroid/content/res/Configuration;

    .line 72
    sput-object v0, Lcom/beyond/BeyondActivity;->vg:Landroid/view/ViewGroup;

    .line 73
    sput-object v0, Lcom/beyond/BeyondActivity;->jf:Lcom/beyond/InputBox;

    .line 75
    sput-object v0, Lcom/beyond/BeyondActivity;->handler:Landroid/os/Handler;

    .line 95
    sput-object v0, Lcom/beyond/BeyondActivity;->gameDisplaySize:Landroid/graphics/Point;

    .line 97
    sput-object v0, Lcom/beyond/BeyondActivity;->carrier:Ljava/lang/String;

    .line 99
    sput-object v0, Lcom/beyond/BeyondActivity;->instance:Lcom/beyond/BeyondActivity;

    .line 101
    sput-boolean v1, Lcom/beyond/BeyondActivity;->isAppHandleReturnKey:Z

    .line 102
    sput-boolean v1, Lcom/beyond/BeyondActivity;->isAppHandleSIDEKey:Z

    .line 52
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 52
    invoke-direct {p0}, Lcom/beyond/KTPurchaseActivity;-><init>()V

    .line 64
    iput-object v0, p0, Lcom/beyond/BeyondActivity;->main_class:Ljava/lang/String;

    .line 71
    iput-object v0, p0, Lcom/beyond/BeyondActivity;->mSensor:Lcom/beyond/Sensor;

    .line 98
    iput-object v0, p0, Lcom/beyond/BeyondActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    .line 546
    iput-object v0, p0, Lcom/beyond/BeyondActivity;->mViewWeb:Landroid/webkit/WebView;

    .line 52
    return-void
.end method

.method private CreateHandler()V
    .locals 1

    .prologue
    .line 605
    new-instance v0, Lcom/beyond/BeyondActivity$1;

    invoke-direct {v0, p0}, Lcom/beyond/BeyondActivity$1;-><init>(Lcom/beyond/BeyondActivity;)V

    sput-object v0, Lcom/beyond/BeyondActivity;->handler:Landroid/os/Handler;

    .line 692
    return-void
.end method

.method public static ShowToast(Ljava/lang/String;)V
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 709
    sget-object v1, Lcom/beyond/BeyondActivity;->context:Landroid/content/Context;

    const/4 v2, 0x1

    invoke-static {v1, p0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 710
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 711
    return-void
.end method

.method public static getAnKeyCode(I)I
    .locals 2
    .param p0, "key"    # I

    .prologue
    .line 246
    const/4 v0, 0x0

    .line 248
    .local v0, "ret":I
    sparse-switch p0, :sswitch_data_0

    .line 305
    :goto_0
    :sswitch_0
    const/16 v1, 0x64

    if-lt p0, v1, :cond_0

    const/16 v1, 0x7d

    if-gt p0, v1, :cond_0

    .line 306
    add-int/lit8 v1, p0, -0x64

    add-int/lit8 v0, v1, 0x1d

    .line 308
    .end local v0    # "ret":I
    :cond_0
    return v0

    .line 250
    .restart local v0    # "ret":I
    :sswitch_1
    const/16 v0, 0x42

    .line 251
    goto :goto_0

    .line 253
    :sswitch_2
    const/16 v0, 0x13

    .line 254
    goto :goto_0

    .line 256
    :sswitch_3
    const/16 v0, 0x16

    .line 257
    goto :goto_0

    .line 259
    :sswitch_4
    const/16 v0, 0x15

    .line 260
    goto :goto_0

    .line 262
    :sswitch_5
    const/16 v0, 0x14

    .line 263
    goto :goto_0

    .line 265
    :sswitch_6
    const/4 v0, 0x5

    .line 266
    goto :goto_0

    .line 268
    :sswitch_7
    const/16 v0, 0x43

    .line 269
    goto :goto_0

    .line 271
    :sswitch_8
    const/16 v0, 0x12

    .line 272
    goto :goto_0

    .line 274
    :sswitch_9
    const/16 v0, 0x11

    .line 275
    goto :goto_0

    .line 277
    :sswitch_a
    const/4 v0, 0x1

    .line 278
    goto :goto_0

    .line 280
    :sswitch_b
    const/4 v0, 0x2

    .line 281
    goto :goto_0

    .line 289
    :sswitch_c
    const/16 v0, 0x1b

    .line 290
    goto :goto_0

    .line 301
    :sswitch_d
    add-int/lit8 v1, p0, -0x30

    add-int/lit8 v0, v1, 0x7

    goto :goto_0

    .line 248
    nop

    :sswitch_data_0
    .sparse-switch
        -0x13 -> :sswitch_c
        -0x10 -> :sswitch_7
        -0xe -> :sswitch_0
        -0xd -> :sswitch_0
        -0xa -> :sswitch_6
        -0x8 -> :sswitch_b
        -0x6 -> :sswitch_a
        -0x5 -> :sswitch_1
        -0x4 -> :sswitch_3
        -0x3 -> :sswitch_4
        -0x2 -> :sswitch_5
        -0x1 -> :sswitch_2
        0x23 -> :sswitch_8
        0x2a -> :sswitch_9
        0x30 -> :sswitch_d
        0x31 -> :sswitch_d
        0x32 -> :sswitch_d
        0x33 -> :sswitch_d
        0x34 -> :sswitch_d
        0x35 -> :sswitch_d
        0x36 -> :sswitch_d
        0x37 -> :sswitch_d
        0x38 -> :sswitch_d
        0x39 -> :sswitch_d
    .end sparse-switch
.end method

.method public static getHandler2()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 543
    sget-object v0, Lcom/beyond/BeyondActivity;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method public static getInputBox()Landroid/view/View;
    .locals 1

    .prologue
    .line 514
    sget-object v0, Lcom/beyond/BeyondActivity;->jf:Lcom/beyond/InputBox;

    return-object v0
.end method

.method public static onHideSUI()V
    .locals 4

    .prologue
    .line 549
    sget-object v0, Lcom/beyond/BeyondActivity;->context:Landroid/content/Context;

    check-cast v0, Lcom/beyond/BeyondActivity;

    .line 550
    .local v0, "acti":Lcom/beyond/BeyondActivity;
    iget-object v3, v0, Lcom/beyond/BeyondActivity;->mViewWeb:Landroid/webkit/WebView;

    if-eqz v3, :cond_0

    .line 551
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 552
    .local v1, "msg":Landroid/os/Message;
    new-instance v2, Lcom/beyond/util/MessageInfo;

    invoke-direct {v2}, Lcom/beyond/util/MessageInfo;-><init>()V

    .line 554
    .local v2, "msgInfo":Lcom/beyond/util/MessageInfo;
    const/4 v3, 0x0

    iput v3, v2, Lcom/beyond/util/MessageInfo;->command:I

    .line 555
    const/4 v3, 0x1

    iput v3, v2, Lcom/beyond/util/MessageInfo;->subCommand:I

    .line 557
    const/16 v3, 0x12c

    iput v3, v1, Landroid/os/Message;->what:I

    .line 558
    iput-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 560
    invoke-static {}, Lcom/beyond/BeyondActivity;->getHandler2()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 562
    .end local v1    # "msg":Landroid/os/Message;
    .end local v2    # "msgInfo":Lcom/beyond/util/MessageInfo;
    :cond_0
    return-void
.end method

.method private onMsgWebView(Lcom/beyond/util/MessageInfo;)V
    .locals 7
    .param p1, "msg"    # Lcom/beyond/util/MessageInfo;

    .prologue
    const/4 v2, 0x4

    .line 565
    iget v0, p1, Lcom/beyond/util/MessageInfo;->subCommand:I

    packed-switch v0, :pswitch_data_0

    .line 589
    :cond_0
    :goto_0
    return-void

    .line 567
    :pswitch_0
    new-instance v0, Landroid/webkit/WebView;

    sget-object v1, Lcom/beyond/BeyondActivity;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/beyond/BeyondActivity;->mViewWeb:Landroid/webkit/WebView;

    .line 568
    iget-object v0, p0, Lcom/beyond/BeyondActivity;->mViewWeb:Landroid/webkit/WebView;

    iget-object v1, p1, Lcom/beyond/util/MessageInfo;->stringValue:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 569
    iget-object v0, p0, Lcom/beyond/BeyondActivity;->mViewWeb:Landroid/webkit/WebView;

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 571
    sget-object v0, Lcom/beyond/BeyondActivity;->vg:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/beyond/BeyondActivity;->mViewWeb:Landroid/webkit/WebView;

    new-instance v2, Landroid/widget/AbsoluteLayout$LayoutParams;

    iget-object v3, p1, Lcom/beyond/util/MessageInfo;->rc:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    iget-object v4, p1, Lcom/beyond/util/MessageInfo;->rc:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    iget-object v5, p1, Lcom/beyond/util/MessageInfo;->rc:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget-object v6, p1, Lcom/beyond/util/MessageInfo;->rc:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 575
    :pswitch_1
    iget-object v0, p0, Lcom/beyond/BeyondActivity;->mViewWeb:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 576
    sget-object v0, Lcom/beyond/BeyondActivity;->vg:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/beyond/BeyondActivity;->mViewWeb:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 577
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/BeyondActivity;->mViewWeb:Landroid/webkit/WebView;

    goto :goto_0

    .line 581
    :pswitch_2
    iget-object v0, p0, Lcom/beyond/BeyondActivity;->mViewWeb:Landroid/webkit/WebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    goto :goto_0

    .line 585
    :pswitch_3
    iget-object v0, p0, Lcom/beyond/BeyondActivity;->mViewWeb:Landroid/webkit/WebView;

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setVisibility(I)V

    goto :goto_0

    .line 565
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static requestAdView(ZLandroid/graphics/Rect;)V
    .locals 2
    .param p0, "isShow"    # Z
    .param p1, "rc"    # Landroid/graphics/Rect;

    .prologue
    .line 138
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 139
    .local v0, "msg":Landroid/os/Message;
    if-eqz p0, :cond_0

    .line 140
    const/16 v1, 0xc8

    iput v1, v0, Landroid/os/Message;->what:I

    .line 141
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 146
    :goto_0
    sget-object v1, Lcom/beyond/BeyondActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 147
    return-void

    .line 144
    :cond_0
    const/16 v1, 0xc9

    iput v1, v0, Landroid/os/Message;->what:I

    goto :goto_0
.end method

.method public static showAdView(Z)V
    .locals 2
    .param p0, "isShow"    # Z

    .prologue
    .line 162
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 163
    .local v0, "msg":Landroid/os/Message;
    if-eqz p0, :cond_0

    .line 164
    const/16 v1, 0xd2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 169
    :goto_0
    sget-object v1, Lcom/beyond/BeyondActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 170
    return-void

    .line 167
    :cond_0
    const/16 v1, 0xd3

    iput v1, v0, Landroid/os/Message;->what:I

    goto :goto_0
.end method

.method public static showDialog(Lcom/beyond/DialogInfo;)V
    .locals 2
    .param p0, "dlgInfo"    # Lcom/beyond/DialogInfo;

    .prologue
    .line 179
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 180
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0xdc

    iput v1, v0, Landroid/os/Message;->what:I

    .line 181
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 182
    sget-object v1, Lcom/beyond/BeyondActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 183
    return-void
.end method

.method public static toShowToast(Ljava/lang/String;)V
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 701
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 702
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x3e6

    iput v1, v0, Landroid/os/Message;->what:I

    .line 703
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 704
    invoke-static {}, Lcom/beyond/BeyondActivity;->getHandler2()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 705
    return-void
.end method


# virtual methods
.method public appStart()V
    .locals 0

    .prologue
    .line 697
    return-void
.end method

.method enableSensor(ZZ)Z
    .locals 4
    .param p1, "isSet"    # Z
    .param p2, "Clet"    # Z

    .prologue
    const/4 v0, 0x1

    .line 518
    if-eqz p1, :cond_2

    .line 519
    iget-object v1, p0, Lcom/beyond/BeyondActivity;->mSensor:Lcom/beyond/Sensor;

    if-eqz v1, :cond_1

    .line 535
    :cond_0
    :goto_0
    return v0

    .line 522
    :cond_1
    new-instance v1, Lcom/beyond/Sensor;

    invoke-direct {v1, p2}, Lcom/beyond/Sensor;-><init>(Z)V

    iput-object v1, p0, Lcom/beyond/BeyondActivity;->mSensor:Lcom/beyond/Sensor;

    .line 523
    iget-object v1, p0, Lcom/beyond/BeyondActivity;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/beyond/BeyondActivity;->mSensor:Lcom/beyond/Sensor;

    .line 524
    const/4 v3, 0x2

    .line 523
    invoke-virtual {v1, v2, v3, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorListener;II)Z

    .line 535
    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    .line 528
    :cond_2
    iget-object v1, p0, Lcom/beyond/BeyondActivity;->mSensor:Lcom/beyond/Sensor;

    if-eqz v1, :cond_0

    .line 531
    iget-object v0, p0, Lcom/beyond/BeyondActivity;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/beyond/BeyondActivity;->mSensor:Lcom/beyond/Sensor;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorListener;)V

    .line 532
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/BeyondActivity;->mSensor:Lcom/beyond/Sensor;

    goto :goto_1
.end method

.method public getWipiKeyCode(I)I
    .locals 2
    .param p1, "key"    # I

    .prologue
    .line 313
    const/4 v0, 0x0

    .line 315
    .local v0, "ret":I
    sparse-switch p1, :sswitch_data_0

    .line 380
    :cond_0
    :goto_0
    const/16 v1, 0x1d

    if-lt p1, v1, :cond_1

    const/16 v1, 0x36

    if-gt p1, v1, :cond_1

    .line 381
    add-int/lit8 v1, p1, 0x64

    add-int/lit8 v0, v1, -0x1d

    .line 383
    .end local v0    # "ret":I
    :cond_1
    return v0

    .line 318
    .restart local v0    # "ret":I
    :sswitch_0
    const/4 v0, -0x5

    .line 319
    goto :goto_0

    .line 321
    :sswitch_1
    const/4 v0, -0x1

    .line 322
    goto :goto_0

    .line 324
    :sswitch_2
    const/4 v0, -0x4

    .line 325
    goto :goto_0

    .line 327
    :sswitch_3
    const/4 v0, -0x3

    .line 328
    goto :goto_0

    .line 330
    :sswitch_4
    const/4 v0, -0x2

    .line 331
    goto :goto_0

    .line 333
    :sswitch_5
    const/16 v0, -0xa

    .line 334
    goto :goto_0

    .line 336
    :sswitch_6
    move v0, p1

    .line 337
    goto :goto_0

    .line 339
    :sswitch_7
    move v0, p1

    .line 340
    goto :goto_0

    .line 343
    :sswitch_8
    const/16 v0, -0x10

    .line 344
    goto :goto_0

    .line 346
    :sswitch_9
    const/16 v0, 0x23

    .line 347
    goto :goto_0

    .line 349
    :sswitch_a
    const/16 v0, 0x2a

    .line 350
    goto :goto_0

    .line 352
    :sswitch_b
    const/4 v0, -0x6

    .line 353
    goto :goto_0

    .line 355
    :sswitch_c
    const/4 v0, -0x8

    .line 356
    goto :goto_0

    .line 358
    :sswitch_d
    sget-boolean v1, Lcom/beyond/BeyondActivity;->isAppHandleSIDEKey:Z

    if-eqz v1, :cond_0

    .line 359
    const/16 v0, -0xe

    .line 360
    goto :goto_0

    .line 362
    :sswitch_e
    sget-boolean v1, Lcom/beyond/BeyondActivity;->isAppHandleSIDEKey:Z

    if-eqz v1, :cond_0

    .line 363
    const/16 v0, -0xd

    .line 364
    goto :goto_0

    .line 366
    :sswitch_f
    const/16 v0, -0x13

    .line 367
    goto :goto_0

    .line 377
    :sswitch_10
    add-int/lit8 v1, p1, 0x30

    add-int/lit8 v0, v1, -0x7

    goto :goto_0

    .line 315
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_b
        0x2 -> :sswitch_c
        0x4 -> :sswitch_7
        0x5 -> :sswitch_5
        0x7 -> :sswitch_10
        0x8 -> :sswitch_10
        0x9 -> :sswitch_10
        0xa -> :sswitch_10
        0xb -> :sswitch_10
        0xc -> :sswitch_10
        0xd -> :sswitch_10
        0xf -> :sswitch_10
        0x10 -> :sswitch_10
        0x11 -> :sswitch_a
        0x12 -> :sswitch_9
        0x13 -> :sswitch_1
        0x14 -> :sswitch_4
        0x15 -> :sswitch_3
        0x16 -> :sswitch_2
        0x17 -> :sswitch_0
        0x18 -> :sswitch_e
        0x19 -> :sswitch_d
        0x1b -> :sswitch_f
        0x1c -> :sswitch_8
        0x42 -> :sswitch_0
        0x43 -> :sswitch_8
        0x52 -> :sswitch_6
    .end sparse-switch
.end method

.method protected getWipiKeyEvent(I)I
    .locals 1
    .param p1, "action"    # I

    .prologue
    .line 387
    const/4 v0, -0x1

    .line 389
    .local v0, "ret":I
    packed-switch p1, :pswitch_data_0

    .line 401
    :goto_0
    return v0

    .line 391
    :pswitch_0
    const/4 v0, 0x1

    .line 392
    goto :goto_0

    .line 394
    :pswitch_1
    const/4 v0, 0x2

    .line 395
    goto :goto_0

    .line 397
    :pswitch_2
    const/4 v0, 0x3

    goto :goto_0

    .line 389
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected onAppPause()V
    .locals 0

    .prologue
    .line 204
    return-void
.end method

.method protected onAppResume()V
    .locals 0

    .prologue
    .line 208
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 503
    const-string v0, "HD_KEYPAD_HIDDEN"

    iget v1, p1, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/beyond/BeyondBridge;->setSystemProperty0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 510
    invoke-super {p0, p1}, Lcom/beyond/KTPurchaseActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 511
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v5, 0x400

    const/4 v4, 0x1

    .line 107
    sput-object p0, Lcom/beyond/BeyondActivity;->context:Landroid/content/Context;

    .line 108
    invoke-direct {p0}, Lcom/beyond/BeyondActivity;->CreateHandler()V

    .line 110
    invoke-super {p0, p1}, Lcom/beyond/KTPurchaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 112
    const-string v2, "carrier"

    invoke-static {v2}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/beyond/BeyondActivity;->carrier:Ljava/lang/String;

    .line 113
    sget-object v2, Lcom/beyond/BeyondActivity;->carrier:Ljava/lang/String;

    const-string v3, "BEYOND"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 114
    const-string v2, "license"

    invoke-static {v2}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 115
    .local v1, "license":Ljava/lang/String;
    const-string v2, "YES"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 116
    sput-boolean v4, Lcom/beyond/BeyondActivity;->CONFIG_BUILD_SDK:Z

    .line 119
    .end local v1    # "license":Ljava/lang/String;
    :cond_0
    const v2, 0x103000a

    invoke-virtual {p0, v2}, Lcom/beyond/BeyondActivity;->setTheme(I)V

    .line 121
    invoke-virtual {p0}, Lcom/beyond/BeyondActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/view/Window;->requestFeature(I)Z

    .line 122
    invoke-virtual {p0}, Lcom/beyond/BeyondActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v5, v5}, Landroid/view/Window;->setFlags(II)V

    .line 124
    const-string v2, "sensor"

    invoke-virtual {p0, v2}, Lcom/beyond/BeyondActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/SensorManager;

    iput-object v2, p0, Lcom/beyond/BeyondActivity;->mSensorManager:Landroid/hardware/SensorManager;

    .line 126
    new-instance v2, Landroid/widget/AbsoluteLayout;

    invoke-direct {v2, p0}, Landroid/widget/AbsoluteLayout;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/beyond/BeyondActivity;->vg:Landroid/view/ViewGroup;

    .line 127
    sget-object v2, Lcom/beyond/BeyondActivity;->vg:Landroid/view/ViewGroup;

    invoke-virtual {p0, v2}, Lcom/beyond/BeyondActivity;->setContentView(Landroid/view/View;)V

    .line 130
    invoke-virtual {p0}, Lcom/beyond/BeyondActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 131
    .local v0, "config":Landroid/content/res/Configuration;
    const-string v2, "KEYPAD"

    iget v3, v0, Landroid/content/res/Configuration;->keyboard:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/beyond/BeyondBridge;->setSystemProperty0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 132
    const-string v2, "HD_KEYPAD_HIDDEN"

    iget v3, v0, Landroid/content/res/Configuration;->hardKeyboardHidden:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/beyond/BeyondBridge;->setSystemProperty0(Ljava/lang/String;Ljava/lang/String;)Z

    .line 135
    return-void
.end method

.method public onLowMemory()V
    .locals 2

    .prologue
    .line 200
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "onLowMemory ... "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 201
    return-void
.end method

.method onMessage(Lcom/beyond/util/MessageInfo;)V
    .locals 1
    .param p1, "msg"    # Lcom/beyond/util/MessageInfo;

    .prologue
    .line 595
    iget v0, p1, Lcom/beyond/util/MessageInfo;->command:I

    packed-switch v0, :pswitch_data_0

    .line 600
    :goto_0
    return-void

    .line 597
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/beyond/BeyondActivity;->onMsgWebView(Lcom/beyond/util/MessageInfo;)V

    goto :goto_0

    .line 595
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 216
    invoke-super {p0}, Lcom/beyond/KTPurchaseActivity;->onPause()V

    .line 218
    return-void
.end method

.method public onRequestAdView(ZLandroid/graphics/Rect;)V
    .locals 3
    .param p1, "isShow"    # Z
    .param p2, "rc"    # Landroid/graphics/Rect;

    .prologue
    .line 150
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "showAdView("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 151
    invoke-static {}, Lcom/beyond/ad/AdMgr;->isSupport()Z

    move-result v0

    if-nez v0, :cond_0

    .line 158
    :goto_0
    return-void

    .line 154
    :cond_0
    if-eqz p1, :cond_1

    .line 155
    invoke-static {}, Lcom/beyond/ad/AdMgr;->getInstance()Lcom/beyond/ad/AdMgr;

    move-result-object v0

    sget-object v1, Lcom/beyond/BeyondActivity;->context:Landroid/content/Context;

    sget-object v2, Lcom/beyond/BeyondActivity;->vg:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1, v2, p2}, Lcom/beyond/ad/AdMgr;->start(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/graphics/Rect;)V

    goto :goto_0

    .line 157
    :cond_1
    invoke-static {}, Lcom/beyond/ad/AdMgr;->getInstance()Lcom/beyond/ad/AdMgr;

    move-result-object v0

    sget-object v1, Lcom/beyond/BeyondActivity;->vg:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Lcom/beyond/ad/AdMgr;->stop(Landroid/view/ViewGroup;)V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 211
    invoke-super {p0}, Lcom/beyond/KTPurchaseActivity;->onResume()V

    .line 213
    return-void
.end method

.method protected onRetryKafInit(Ljava/lang/Object;)V
    .locals 0
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    .line 592
    return-void
.end method

.method public onShowAdView(Z)V
    .locals 1
    .param p1, "isShow"    # Z

    .prologue
    .line 173
    invoke-static {}, Lcom/beyond/ad/AdMgr;->isSupport()Z

    move-result v0

    if-nez v0, :cond_0

    .line 176
    :goto_0
    return-void

    .line 175
    :cond_0
    invoke-static {}, Lcom/beyond/ad/AdMgr;->getInstance()Lcom/beyond/ad/AdMgr;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/beyond/ad/AdMgr;->setVisible(Z)V

    goto :goto_0
.end method

.method protected onShowAnnun()V
    .locals 0

    .prologue
    .line 539
    return-void
.end method

.method protected onShowDialog(Ljava/lang/Object;)V
    .locals 6
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    .line 186
    move-object v0, p1

    check-cast v0, Lcom/beyond/DialogInfo;

    .line 187
    .local v0, "dlgInfo":Lcom/beyond/DialogInfo;
    iget-object v1, p0, Lcom/beyond/BeyondActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    iget-object v2, v0, Lcom/beyond/DialogInfo;->title:Ljava/lang/String;

    iget-object v3, v0, Lcom/beyond/DialogInfo;->content:Ljava/lang/String;

    iget v4, v0, Lcom/beyond/DialogInfo;->type:I

    iget-object v5, v0, Lcom/beyond/DialogInfo;->listener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/beyond/screen/ScreenConfig;->showDlg(Ljava/lang/String;Ljava/lang/String;ILandroid/content/DialogInterface$OnClickListener;)I

    .line 188
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 233
    invoke-super {p0}, Lcom/beyond/KTPurchaseActivity;->onStart()V

    .line 242
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 221
    invoke-super {p0}, Lcom/beyond/KTPurchaseActivity;->onStop()V

    .line 230
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3
    .param p1, "hasFocus"    # Z

    .prologue
    .line 192
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onWindowFocusChanged("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 193
    if-eqz p1, :cond_0

    .line 194
    invoke-virtual {p0}, Lcom/beyond/BeyondActivity;->onAppResume()V

    .line 197
    :goto_0
    return-void

    .line 196
    :cond_0
    invoke-virtual {p0}, Lcom/beyond/BeyondActivity;->onAppPause()V

    goto :goto_0
.end method
