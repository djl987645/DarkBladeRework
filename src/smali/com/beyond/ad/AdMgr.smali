.class public Lcom/beyond/ad/AdMgr;
.super Ljava/lang/Object;
.source "AdMgr.java"


# static fields
.field private static instance:Lcom/beyond/ad/AdMgr;

.field private static supportCheck:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const/4 v0, 0x0

    sput-object v0, Lcom/beyond/ad/AdMgr;->instance:Lcom/beyond/ad/AdMgr;

    .line 13
    const/4 v0, -0x1

    sput v0, Lcom/beyond/ad/AdMgr;->supportCheck:I

    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/beyond/ad/AdMgr;
    .locals 2

    .prologue
    .line 33
    :try_start_0
    sget-object v1, Lcom/beyond/ad/AdMgr;->instance:Lcom/beyond/ad/AdMgr;

    if-nez v1, :cond_0

    .line 34
    const-string v1, "com.beyond.ad.AdMobMgr"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 35
    .local v0, "justclass":Ljava/lang/Class;
    if-eqz v0, :cond_0

    .line 36
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/beyond/ad/AdMgr;

    sput-object v1, Lcom/beyond/ad/AdMgr;->instance:Lcom/beyond/ad/AdMgr;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    :cond_0
    :goto_0
    sget-object v1, Lcom/beyond/ad/AdMgr;->instance:Lcom/beyond/ad/AdMgr;

    return-object v1

    .line 40
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static isSupport()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 16
    sget v2, Lcom/beyond/ad/AdMgr;->supportCheck:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    .line 17
    invoke-static {}, Lcom/beyond/ad/AdMgr;->getInstance()Lcom/beyond/ad/AdMgr;

    move-result-object v2

    if-nez v2, :cond_1

    .line 18
    sput v0, Lcom/beyond/ad/AdMgr;->supportCheck:I

    .line 28
    :cond_0
    :goto_0
    return v0

    .line 22
    :cond_1
    sput v1, Lcom/beyond/ad/AdMgr;->supportCheck:I

    move v0, v1

    .line 23
    goto :goto_0

    .line 26
    :cond_2
    sget v2, Lcom/beyond/ad/AdMgr;->supportCheck:I

    if-ne v2, v1, :cond_0

    move v0, v1

    .line 27
    goto :goto_0
.end method


# virtual methods
.method public setVisible(Z)V
    .locals 0
    .param p1, "isVisible"    # Z

    .prologue
    .line 53
    return-void
.end method

.method public start(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/graphics/Rect;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "vg"    # Landroid/view/ViewGroup;
    .param p3, "rc"    # Landroid/graphics/Rect;

    .prologue
    .line 47
    return-void
.end method

.method public stop(Landroid/view/ViewGroup;)V
    .locals 0
    .param p1, "vg"    # Landroid/view/ViewGroup;

    .prologue
    .line 50
    return-void
.end method
