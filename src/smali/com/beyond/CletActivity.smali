.class public Lcom/beyond/CletActivity;
.super Lcom/beyond/BeyondActivity;
.source "CletActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/beyond/CletActivity$AppFrameBuffer;
    }
.end annotation


# static fields
.field public static final MH_ANN_EVENT:I = 0x8

.field public static final MH_CALL_EVENT:I = 0x7

.field public static final MH_EXIT_EVENT:I = 0x1

.field public static final MH_KEY_PRESSEVENT:I = 0x2

.field public static final MH_KEY_RELEASEEVENT:I = 0x3

.field public static final MH_KEY_REPEATEVENT:I = 0x4

.field public static final MH_MEDIA_EVENT:I = 0xb

.field public static final MH_MOTION_EVENT:I = 0x14

.field public static final MH_NETWORK_EVENT:I = 0x9

.field public static final MH_POINTER_DBLCLK_EVENT:I = 0x12

.field public static final MH_POINTER_REPEAT_EVENT:I = 0x13

.field public static final MH_POINT_DRAGEVENT:I = 0x11

.field public static final MH_POINT_PRESSEVENT:I = 0xf

.field public static final MH_POINT_RELEASEEVENT:I = 0x10

.field public static final MH_RESTART_EVENT:I = 0xe

.field public static final MH_RESUME_EVENT:I = 0xd

.field public static final MH_SERIAL_EVENT:I = 0xa

.field public static final MH_SMS_EVENT:I = 0x6

.field public static final MH_SUSPEND_EVENT:I = 0xc

.field public static final MH_TIMER_EVENT:I = 0x5

.field private static appTh:Lcom/beyond/AppThread;

.field private static gameDisplaySize:Landroid/graphics/Point;

.field private static ktdrmcheckactivity:Lcom/beyond/KtDrmCheckActivity;

.field public static s_pool_type:Ljava/lang/String;

.field public static soundPoolRes:[Ljava/lang/String;

.field public static view:Lcom/beyond/CletView;


# instance fields
.field bThreadStart:Z

.field private firstResume:Z

.field private fullScreen:Z

.field isDocomoAuth:Z

.field private mCanvas:Landroid/graphics/Canvas;

.field private mHolder:Landroid/view/SurfaceHolder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 103
    sput-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    .line 109
    sput-object v0, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    .line 110
    sput-object v0, Lcom/beyond/CletActivity;->gameDisplaySize:Landroid/graphics/Point;

    .line 112
    sput-object v0, Lcom/beyond/CletActivity;->soundPoolRes:[Ljava/lang/String;

    .line 119
    const-string v0, ""

    sput-object v0, Lcom/beyond/CletActivity;->s_pool_type:Ljava/lang/String;

    .line 75
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 75
    invoke-direct {p0}, Lcom/beyond/BeyondActivity;-><init>()V

    .line 101
    iput-object v2, p0, Lcom/beyond/CletActivity;->mCanvas:Landroid/graphics/Canvas;

    .line 102
    iput-object v2, p0, Lcom/beyond/CletActivity;->mHolder:Landroid/view/SurfaceHolder;

    .line 104
    iput-boolean v1, p0, Lcom/beyond/CletActivity;->fullScreen:Z

    .line 107
    iput-boolean v1, p0, Lcom/beyond/CletActivity;->firstResume:Z

    .line 115
    iput-boolean v0, p0, Lcom/beyond/CletActivity;->isDocomoAuth:Z

    .line 116
    iput-boolean v0, p0, Lcom/beyond/CletActivity;->bThreadStart:Z

    .line 75
    return-void
.end method

.method static synthetic access$0(Lcom/beyond/CletActivity;Landroid/view/SurfaceHolder;)V
    .locals 0

    .prologue
    .line 102
    iput-object p1, p0, Lcom/beyond/CletActivity;->mHolder:Landroid/view/SurfaceHolder;

    return-void
.end method

.method static synthetic access$1(Lcom/beyond/CletActivity;)Landroid/view/SurfaceHolder;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/beyond/CletActivity;->mHolder:Landroid/view/SurfaceHolder;

    return-object v0
.end method

.method static synthetic access$2(Lcom/beyond/CletActivity;Landroid/graphics/Canvas;)V
    .locals 0

    .prologue
    .line 101
    iput-object p1, p0, Lcom/beyond/CletActivity;->mCanvas:Landroid/graphics/Canvas;

    return-void
.end method

.method static synthetic access$3(Lcom/beyond/CletActivity;)Landroid/graphics/Canvas;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/beyond/CletActivity;->mCanvas:Landroid/graphics/Canvas;

    return-object v0
.end method

.method static synthetic access$4()Lcom/beyond/AppThread;
    .locals 1

    .prologue
    .line 103
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    return-object v0
.end method

.method public static handleNetEvent(II)V
    .locals 1
    .param p0, "arg0"    # I
    .param p1, "arg1"    # I

    .prologue
    .line 856
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    if-eqz v0, :cond_0

    .line 857
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0, p0, p1}, Lcom/beyond/AppThread;->BhandleNetEvent(II)V

    .line 859
    :cond_0
    return-void
.end method

.method public static handleSendBuyEvent(II)V
    .locals 1
    .param p0, "arg0"    # I
    .param p1, "arg1"    # I

    .prologue
    .line 849
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    if-eqz v0, :cond_0

    .line 850
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0, p0, p1}, Lcom/beyond/AppThread;->BhandleBuyEvent(II)V

    .line 852
    :cond_0
    return-void
.end method

.method public static sendMotionEvent(III)V
    .locals 1
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # I

    .prologue
    .line 758
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    if-eqz v0, :cond_0

    .line 759
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0, p0, p1, p2}, Lcom/beyond/AppThread;->BhandleMotionEvent(III)V

    .line 761
    :cond_0
    return-void
.end method

.method public static sendWipiKeyEvent(II)V
    .locals 1
    .param p0, "action"    # I
    .param p1, "key"    # I

    .prologue
    .line 746
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    if-eqz v0, :cond_0

    .line 747
    const/4 v0, 0x1

    if-ne p0, v0, :cond_1

    .line 748
    const/4 p0, 0x2

    .line 753
    :goto_0
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0, p0, p1}, Lcom/beyond/AppThread;->BhandleKeyEvent(II)Z

    .line 755
    :cond_0
    return-void

    .line 749
    :cond_1
    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    .line 750
    const/4 p0, 0x3

    goto :goto_0
.end method

.method private showExitDlg()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 794
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0}, Lcom/beyond/AppThread;->pltPause()V

    .line 795
    const-string v0, "locale"

    invoke-static {v0}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ko"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 796
    iget-object v0, p0, Lcom/beyond/CletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    const-string v1, "\uc885\ub8cc"

    const-string v2, "\uc885\ub8cc\ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c ?"

    new-instance v3, Lcom/beyond/CletActivity$1;

    invoke-direct {v3, p0}, Lcom/beyond/CletActivity$1;-><init>(Lcom/beyond/CletActivity;)V

    invoke-virtual {v0, v1, v2, v4, v3}, Lcom/beyond/screen/ScreenConfig;->showDlg(Ljava/lang/String;Ljava/lang/String;ILandroid/content/DialogInterface$OnClickListener;)I

    .line 820
    :goto_0
    return-void

    .line 808
    :cond_0
    iget-object v0, p0, Lcom/beyond/CletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    const-string v1, "Exit"

    const-string v2, "Are you sure to Exit?"

    new-instance v3, Lcom/beyond/CletActivity$2;

    invoke-direct {v3, p0}, Lcom/beyond/CletActivity$2;-><init>(Lcom/beyond/CletActivity;)V

    invoke-virtual {v0, v1, v2, v4, v3}, Lcom/beyond/screen/ScreenConfig;->showDlg(Ljava/lang/String;Ljava/lang/String;ILandroid/content/DialogInterface$OnClickListener;)I

    goto :goto_0
.end method

    # [화면 구성] ScreenConfig 초기화 → CletView 생성 → setCanvasSize → AppThread.start()
    .method private subCreate()V
    .locals 11

    .prologue
    const/4 v3, 0x0

    .line 388
    new-instance v0, Lcom/beyond/screen/ScreenConfig;

    invoke-direct {v0}, Lcom/beyond/screen/ScreenConfig;-><init>()V

    iput-object v0, p0, Lcom/beyond/CletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    .line 389
    iget-object v0, p0, Lcom/beyond/CletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    new-instance v1, Landroid/graphics/Point;

    sget-object v2, Lcom/beyond/CletActivity;->vg:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getWidth()I

    move-result v2

    sget-object v4, Lcom/beyond/CletActivity;->vg:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getHeight()I

    move-result v4

    invoke-direct {v1, v2, v4}, Landroid/graphics/Point;-><init>(II)V

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Lcom/beyond/screen/ScreenConfig;->initConfig(Landroid/content/Context;Landroid/graphics/Point;Z)V

    .line 390
    iget-object v0, p0, Lcom/beyond/CletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v0}, Lcom/beyond/screen/ScreenConfig;->getScreenMode()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/beyond/CletActivity;->setRequestedOrientation(I)V

    .line 392
    new-instance v0, Lcom/beyond/CletActivity$AppFrameBuffer;

    invoke-direct {v0, p0, p0}, Lcom/beyond/CletActivity$AppFrameBuffer;-><init>(Lcom/beyond/CletActivity;Landroid/content/Context;)V

    sput-object v0, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    .line 393
    iget-object v0, p0, Lcom/beyond/CletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v0}, Lcom/beyond/screen/ScreenConfig;->getPlayerRect()Landroid/graphics/Rect;

    move-result-object v10

    .line 396
    .local v10, "playerRect":Landroid/graphics/Rect;
    const/16 v8, 0x64

    .line 398
    .local v8, "display_size":I
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 399
    const/16 v8, 0x5f

    .line 403
    :cond_0
    if-nez v10, :cond_2

    .line 405
    const-string v0, "window"

    invoke-virtual {p0, v0}, Lcom/beyond/CletActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    .line 406
    .local v7, "display":Landroid/view/Display;
    sget-object v0, Lcom/beyond/CletActivity;->vg:Landroid/view/ViewGroup;

    sget-object v1, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    new-instance v2, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {v7}, Landroid/view/Display;->getWidth()I

    move-result v4

    invoke-virtual {v7}, Landroid/view/Display;->getHeight()I

    move-result v5

    invoke-direct {v2, v4, v5, v3, v3}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 407
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v7}, Landroid/view/Display;->getWidth()I

    move-result v1

    invoke-virtual {v7}, Landroid/view/Display;->getHeight()I

    move-result v2

    invoke-virtual {v7}, Landroid/view/Display;->getWidth()I

    move-result v5

    invoke-virtual {v7}, Landroid/view/Display;->getHeight()I

    move-result v6

    move v4, v3

    invoke-virtual/range {v0 .. v6}, Lcom/beyond/AppThread;->setCanvasSize(IIIIII)V

    .line 429
    .end local v7    # "display":Landroid/view/Display;
    :goto_0
    iget-boolean v0, p0, Lcom/beyond/CletActivity;->isDocomoAuth:Z

    if-nez v0, :cond_1

    .line 430
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0, p0}, Lcom/beyond/AppThread;->setContext(Landroid/content/Context;)V

    .line 431
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0}, Lcom/beyond/AppThread;->start()V

    .line 436
    :cond_1
    new-instance v0, Lcom/beyond/KtDrmCheckActivity;

    invoke-direct {v0}, Lcom/beyond/KtDrmCheckActivity;-><init>()V

    sput-object v0, Lcom/beyond/CletActivity;->ktdrmcheckactivity:Lcom/beyond/KtDrmCheckActivity;

    .line 439
    return-void

    .line 411
    :cond_2
    iget-object v0, p0, Lcom/beyond/CletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v0}, Lcom/beyond/screen/ScreenConfig;->getGameDisplayRect()Landroid/graphics/Rect;

    move-result-object v9

    .line 412
    .local v9, "gameDisplayRect":Landroid/graphics/Rect;
    if-nez v9, :cond_3

    .line 413
    new-instance v0, Landroid/graphics/Point;

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    sput-object v0, Lcom/beyond/CletActivity;->gameDisplaySize:Landroid/graphics/Point;

    .line 421
    :goto_1
    sget-object v0, Lcom/beyond/CletActivity;->vg:Landroid/view/ViewGroup;

    sget-object v1, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    new-instance v2, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v4

    mul-int/2addr v4, v8

    div-int/lit8 v4, v4, 0x64

    iget v5, v10, Landroid/graphics/Rect;->left:I

    iget v6, v10, Landroid/graphics/Rect;->top:I

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 422
    iget-object v0, p0, Lcom/beyond/CletActivity;->scrConfig:Lcom/beyond/screen/ScreenConfig;

    sget-object v1, Lcom/beyond/CletActivity;->vg:Landroid/view/ViewGroup;

    sget-object v2, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    const/4 v3, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/beyond/screen/ScreenConfig;->makeScreen(Landroid/view/ViewGroup;Landroid/view/View;I)V

    .line 423
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    sget-object v1, Lcom/beyond/CletActivity;->gameDisplaySize:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->x:I

    sget-object v2, Lcom/beyond/CletActivity;->gameDisplaySize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    iget v3, v10, Landroid/graphics/Rect;->left:I

    iget v4, v10, Landroid/graphics/Rect;->top:I

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v5

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v6

    mul-int/2addr v6, v8

    div-int/lit8 v6, v6, 0x64

    invoke-virtual/range {v0 .. v6}, Lcom/beyond/AppThread;->setCanvasSize(IIIIII)V

    goto :goto_0

    .line 417
    :cond_3
    new-instance v0, Landroid/graphics/Point;

    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    sput-object v0, Lcom/beyond/CletActivity;->gameDisplaySize:Landroid/graphics/Point;

    .line 418
    sget-object v0, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v3

    mul-int/2addr v3, v8

    div-int/lit8 v3, v3, 0x64

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/beyond/CletView;->setScaleRatio(FF)V

    goto :goto_1
.end method


# virtual methods
.method public appStart()V
    .locals 2

    .prologue
    .line 484
    sget-object v0, Lcom/beyond/CletActivity;->soundPoolRes:[Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 485
    new-instance v0, Lcom/beyond/AppThread;

    sget-object v1, Lcom/beyond/CletActivity;->soundPoolRes:[Ljava/lang/String;

    invoke-direct {v0, p0, v1}, Lcom/beyond/AppThread;-><init>(Lcom/beyond/CletActivity;[Ljava/lang/String;)V

    sput-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    .line 488
    :goto_0
    invoke-direct {p0}, Lcom/beyond/CletActivity;->subCreate()V

    .line 489
    return-void

    .line 487
    :cond_0
    new-instance v0, Lcom/beyond/AppThread;

    invoke-direct {v0, p0}, Lcom/beyond/AppThread;-><init>(Lcom/beyond/CletActivity;)V

    sput-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    goto :goto_0
.end method

.method public destroyProcess()V
    .locals 1

    .prologue
    .line 499
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 500
    return-void
.end method

.method public drawsui()V
    .locals 2

    .prologue
    .line 776
    sget-object v0, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    iget-object v1, p0, Lcom/beyond/CletActivity;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v1}, Lcom/beyond/CletView;->onDraw(Landroid/graphics/Canvas;)V

    .line 777
    return-void
.end method

.method public finish()V
    .locals 1

    .prologue
    .line 492
    invoke-super {p0}, Lcom/beyond/BeyondActivity;->finish()V

    .line 493
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    if-eqz v0, :cond_0

    .line 494
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0}, Lcom/beyond/AppThread;->pltFinish()V

    .line 495
    :cond_0
    return-void
.end method

.method public netSocketConnect(Ljava/lang/Object;)V
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 864
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    if-eqz v0, :cond_0

    .line 865
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0, p1}, Lcom/beyond/AppThread;->MyScoket_connection(Ljava/lang/Object;)V

    .line 867
    :cond_0
    return-void
.end method

.method protected onAppPause()V
    .locals 1

    .prologue
    .line 671
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    if-eqz v0, :cond_0

    .line 672
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0}, Lcom/beyond/AppThread;->pltPause()V

    .line 673
    :cond_0
    return-void
.end method

.method protected onAppResume()V
    .locals 1

    .prologue
    .line 677
    iget-boolean v0, p0, Lcom/beyond/CletActivity;->firstResume:Z

    if-eqz v0, :cond_1

    .line 678
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/CletActivity;->firstResume:Z

    .line 683
    :cond_0
    :goto_0
    return-void

    .line 681
    :cond_1
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    if-eqz v0, :cond_0

    .line 682
    sget-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v0}, Lcom/beyond/AppThread;->pltResume()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 442
    sput-object p0, Lcom/beyond/CletActivity;->instance:Lcom/beyond/BeyondActivity;

    .line 443
    invoke-super {p0, p1}, Lcom/beyond/BeyondActivity;->onCreate(Landroid/os/Bundle;)V

    .line 444
    sput-object p0, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    .line 445
    new-instance v0, Lcom/beyond/AppThread;

    invoke-direct {v0, p0}, Lcom/beyond/AppThread;-><init>(Lcom/beyond/CletActivity;)V

    sput-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    .line 446
    invoke-direct {p0}, Lcom/beyond/CletActivity;->subCreate()V

    .line 447
    return-void
.end method

    # [액티비티] 메인 생성 — 사운드 배열 전달받아 AppThread 생성·시작
    .method public onCreate(Landroid/os/Bundle;[Ljava/lang/String;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .param p2, "resNames"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 450
    sput-object p0, Lcom/beyond/CletActivity;->instance:Lcom/beyond/BeyondActivity;

    .line 451
    invoke-super {p0, p1}, Lcom/beyond/BeyondActivity;->onCreate(Landroid/os/Bundle;)V

    .line 452
    sput-object p0, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    .line 453
    new-instance v0, Lcom/beyond/AppThread;

    invoke-direct {v0, p0, p2}, Lcom/beyond/AppThread;-><init>(Lcom/beyond/CletActivity;[Ljava/lang/String;)V

    sput-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    .line 454
    aget-object v0, p2, v1

    aget-object v1, p2, v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/beyond/CletActivity;->s_pool_type:Ljava/lang/String;

    .line 455
    invoke-direct {p0}, Lcom/beyond/CletActivity;->subCreate()V

    .line 456
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .param p2, "resNames"    # [Ljava/lang/String;
    .param p3, "appID"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 459
    sput-object p0, Lcom/beyond/CletActivity;->instance:Lcom/beyond/BeyondActivity;

    .line 460
    invoke-super {p0, p1}, Lcom/beyond/BeyondActivity;->onCreate(Landroid/os/Bundle;)V

    .line 461
    sput-object p0, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    .line 462
    sput-object p2, Lcom/beyond/CletActivity;->soundPoolRes:[Ljava/lang/String;

    .line 463
    aget-object v0, p2, v1

    aget-object v1, p2, v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/beyond/CletActivity;->s_pool_type:Ljava/lang/String;

    .line 465
    new-instance v0, Lcom/beyond/AppThread;

    invoke-direct {v0, p0, p2}, Lcom/beyond/AppThread;-><init>(Lcom/beyond/CletActivity;[Ljava/lang/String;)V

    sput-object v0, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    .line 466
    invoke-direct {p0}, Lcom/beyond/CletActivity;->subCreate()V

    .line 469
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 728
    invoke-super {p0}, Lcom/beyond/BeyondActivity;->onDestroy()V

    .line 729
    invoke-virtual {p0}, Lcom/beyond/CletActivity;->destroyProcess()V

    .line 730
    return-void
.end method

    # [입력] 하드웨어 키 입력 → 네이티브 BhandleKeyEvent로 전달
    .method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 9
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v6, 0x1

    .line 595
    sget-boolean v7, Lcom/beyond/CletActivity;->isAppHandleSIDEKey:Z

    if-eqz v7, :cond_2

    .line 596
    const/16 v7, 0x19

    if-ne p1, v7, :cond_1

    .line 598
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "getWipiKeyCode = KeyEvent.KEYCODE_VOLUME_DOWN"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 599
    const-string v7, "audio"

    invoke-virtual {p0, v7}, Lcom/beyond/CletActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 600
    .local v0, "am":Landroid/media/AudioManager;
    const/4 v2, 0x3

    .line 601
    .local v2, "streamType":I
    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v7

    mul-int/lit8 v7, v7, 0x64

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v8

    div-int v4, v7, v8

    .line 602
    .local v4, "volume":I
    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v1

    .line 603
    .local v1, "max":I
    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v3

    .line 604
    .local v3, "vol":I
    add-int/lit8 v7, v4, -0xa

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v8

    mul-int/2addr v7, v8

    div-int/lit8 v7, v7, 0x64

    invoke-virtual {v0, v2, v7, v6}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 621
    .end local v0    # "am":Landroid/media/AudioManager;
    .end local v1    # "max":I
    .end local v2    # "streamType":I
    .end local v3    # "vol":I
    .end local v4    # "volume":I
    :cond_0
    :goto_0
    return v6

    .line 607
    :cond_1
    const/16 v7, 0x18

    if-ne p1, v7, :cond_2

    .line 608
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "getWipiKeyCode = KeyEvent.KEYCODE_VOLUME_UP"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 609
    const-string v7, "audio"

    invoke-virtual {p0, v7}, Lcom/beyond/CletActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 610
    .restart local v0    # "am":Landroid/media/AudioManager;
    const/4 v2, 0x3

    .line 611
    .restart local v2    # "streamType":I
    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v7

    mul-int/lit8 v7, v7, 0x64

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v8

    div-int v4, v7, v8

    .line 612
    .restart local v4    # "volume":I
    add-int/lit8 v7, v4, 0xa

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v8

    mul-int/2addr v7, v8

    div-int/lit8 v7, v7, 0x64

    invoke-virtual {v0, v2, v7, v6}, Landroid/media/AudioManager;->setStreamVolume(III)V

    goto :goto_0

    .line 617
    .end local v0    # "am":Landroid/media/AudioManager;
    .end local v2    # "streamType":I
    .end local v4    # "volume":I
    :cond_2
    invoke-virtual {p0, p1}, Lcom/beyond/CletActivity;->getWipiKeyCode(I)I

    move-result v5

    .line 618
    .local v5, "wipikey":I
    if-eqz v5, :cond_3

    sget-object v7, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    const/4 v8, 0x2

    invoke-virtual {v7, v8, v5}, Lcom/beyond/AppThread;->BhandleKeyEvent(II)Z

    move-result v7

    if-nez v7, :cond_0

    .line 621
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/beyond/BeyondActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v6

    goto :goto_0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    .line 626
    sget-boolean v2, Lcom/beyond/CletActivity;->isAppHandleReturnKey:Z

    if-nez v2, :cond_1

    .line 627
    const/4 v2, 0x4

    if-ne p1, v2, :cond_1

    .line 628
    invoke-direct {p0}, Lcom/beyond/CletActivity;->showExitDlg()V

    .line 638
    :cond_0
    :goto_0
    return v1

    .line 634
    :cond_1
    invoke-virtual {p0, p1}, Lcom/beyond/CletActivity;->getWipiKeyCode(I)I

    move-result v0

    .line 635
    .local v0, "wipikey":I
    if-eqz v0, :cond_2

    sget-object v2, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    const/4 v3, 0x3

    invoke-virtual {v2, v3, v0}, Lcom/beyond/AppThread;->BhandleKeyEvent(II)Z

    move-result v2

    if-nez v2, :cond_0

    .line 638
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/beyond/BeyondActivity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method public onLowMemory()V
    .locals 0

    .prologue
    .line 737
    invoke-super {p0}, Lcom/beyond/BeyondActivity;->onLowMemory()V

    .line 738
    return-void
.end method

.method protected onRestart()V
    .locals 0

    .prologue
    .line 699
    invoke-super {p0}, Lcom/beyond/BeyondActivity;->onRestart()V

    .line 700
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 715
    invoke-super {p0}, Lcom/beyond/BeyondActivity;->onStart()V

    .line 716
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 707
    invoke-super {p0}, Lcom/beyond/BeyondActivity;->onStop()V

    .line 708
    return-void
.end method

    # [입력] 터치 이벤트 → 네이티브 BhandleTouchPress/Release/Drag로 전달
    .method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v3, 0x1

    .line 643
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 645
    .local v0, "type":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    float-to-int v1, v4

    .line 646
    .local v1, "x":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v2, v4

    .line 647
    .local v2, "y":I
    sget-object v4, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    iget v4, v4, Lcom/beyond/CletView;->x_ratio:F

    cmpl-float v4, v4, v7

    if-eqz v4, :cond_0

    .line 648
    int-to-float v4, v1

    sget-object v5, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    iget v5, v5, Lcom/beyond/CletView;->x_ratio:F

    mul-float/2addr v4, v5

    float-to-int v1, v4

    .line 649
    :cond_0
    sget-object v4, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    iget v4, v4, Lcom/beyond/CletView;->y_ratio:F

    cmpl-float v4, v4, v7

    if-eqz v4, :cond_1

    .line 650
    int-to-float v4, v2

    sget-object v5, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    iget v5, v5, Lcom/beyond/CletView;->y_ratio:F

    mul-float/2addr v4, v5

    float-to-int v2, v4

    .line 652
    :cond_1
    if-nez v0, :cond_2

    .line 653
    sget-object v4, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v4, v1, v2, v6}, Lcom/beyond/AppThread;->BhandleTouchPress(III)V

    .line 665
    :goto_0
    return v3

    .line 656
    :cond_2
    if-ne v0, v3, :cond_3

    .line 657
    sget-object v4, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v4, v1, v2, v6}, Lcom/beyond/AppThread;->BhandleTouchRelease(III)V

    goto :goto_0

    .line 660
    :cond_3
    const/4 v4, 0x2

    if-ne v0, v4, :cond_4

    .line 661
    sget-object v4, Lcom/beyond/CletActivity;->appTh:Lcom/beyond/AppThread;

    invoke-virtual {v4, v1, v2, v6}, Lcom/beyond/AppThread;->BhandleTouchDrag(III)V

    goto :goto_0

    .line 665
    :cond_4
    invoke-super {p0, p1}, Lcom/beyond/BeyondActivity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    goto :goto_0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 742
    invoke-super {p0, p1}, Lcom/beyond/BeyondActivity;->onTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public startCheck(Ljava/lang/String;)V
    .locals 3
    .param p1, "appID"    # Ljava/lang/String;

    .prologue
    .line 474
    :try_start_0
    const-string v2, "com.skt.ScreenConfig"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 475
    .local v1, "justclass":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/beyond/screen/ScreenConfig;

    invoke-virtual {v2, p1}, Lcom/beyond/screen/ScreenConfig;->runCheck(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 480
    .end local v1    # "justclass":Ljava/lang/Class;
    :goto_0
    return-void

    .line 476
    :catch_0
    move-exception v0

    .line 478
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public suiGetValue(ILjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 779
    sget-object v0, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    invoke-virtual {v0, p1, p2}, Lcom/beyond/CletView;->suiGetValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public suiSetValue(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    .line 782
    sget-object v0, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/CletView;->suiSetValue(ILjava/lang/String;Ljava/lang/String;)V

    .line 783
    return-void
.end method

.method public suihide(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 770
    sget-object v0, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    invoke-virtual {v0, p1}, Lcom/beyond/CletView;->suihide(Ljava/lang/String;)V

    .line 771
    return-void
.end method

.method public suihideall()V
    .locals 1

    .prologue
    .line 773
    sget-object v0, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    invoke-virtual {v0}, Lcom/beyond/CletView;->suihideall()V

    .line 774
    return-void
.end method

.method public suiinit()V
    .locals 0

    .prologue
    .line 764
    return-void
.end method

.method public suishow(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 766
    sget-object v0, Lcom/beyond/CletActivity;->view:Lcom/beyond/CletView;

    invoke-virtual {v0, p1}, Lcom/beyond/CletView;->suishow(Ljava/lang/String;)V

    .line 767
    return-void
.end method
