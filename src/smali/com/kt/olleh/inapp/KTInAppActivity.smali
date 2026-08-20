.class public abstract Lcom/kt/olleh/inapp/KTInAppActivity;
.super Landroid/app/Activity;
.source "KTInAppActivity.java"

# interfaces
.implements Lcom/kt/olleh/inapp/ILibMode;


# instance fields
.field public final TAG:Ljava/lang/String;

.field private mAuthen:Ljava/lang/String;

.field private mInApp:Lcom/kt/olleh/inapp/InApp;

.field private mLibMode:I

.field private mListener:Lcom/kt/olleh/inapp/OnInAppListener;

.field private mPurchase:Lcom/kt/olleh/inapp/Purchase;

.field mService:Lcom/kt/olleh/inapp/IRemoteInapService;

.field serviceConnection:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 39
    const/4 v0, -0x1

    iput v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mLibMode:I

    .line 42
    const-string v0, "KTInAppActivity"

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->TAG:Ljava/lang/String;

    .line 891
    new-instance v0, Lcom/kt/olleh/inapp/KTInAppActivity$1;

    invoke-direct {v0, p0}, Lcom/kt/olleh/inapp/KTInAppActivity$1;-><init>(Lcom/kt/olleh/inapp/KTInAppActivity;)V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->serviceConnection:Landroid/content/ServiceConnection;

    .line 22
    return-void
.end method

.method static synthetic access$0(Lcom/kt/olleh/inapp/KTInAppActivity;)V
    .locals 0

    .prologue
    .line 886
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->onServiceStop()V

    return-void
.end method

.method private getPhoneNumber()Ljava/lang/String;
    .locals 3

    .prologue
    .line 113
    const-string v2, "phone"

    invoke-virtual {p0, v2}, Lcom/kt/olleh/inapp/KTInAppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 114
    .local v1, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "phoneNo":Ljava/lang/String;
    return-object v0
.end method

.method private getUserInfo()Ljava/lang/String;
    .locals 6

    .prologue
    .line 160
    const/4 v2, 0x0

    .line 161
    .local v2, "userInfo":Ljava/lang/String;
    sget-object v3, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 163
    iget v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mLibMode:I

    packed-switch v3, :pswitch_data_0

    .line 179
    :cond_0
    :goto_0
    sget-object v3, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 181
    sget-boolean v3, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v3, :cond_1

    const-string v3, "KTInAppActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "UserInfo.information = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    :cond_1
    :goto_1
    sget-object v2, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    .line 189
    return-object v2

    .line 166
    :pswitch_0
    const-string v3, "phone"

    invoke-virtual {p0, v3}, Lcom/kt/olleh/inapp/KTInAppActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 167
    .local v1, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v0

    .line 168
    .local v0, "phoneNo":Ljava/lang/String;
    sput-object v0, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    goto :goto_0

    .line 171
    .end local v0    # "phoneNo":Ljava/lang/String;
    .end local v1    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :pswitch_1
    sget-boolean v3, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "KTInAppActivity"

    const-string v4, "ILibMode.mode_SoIP number not exist"

    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/Config/Config;->LogE(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 174
    :pswitch_2
    sget-boolean v3, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "KTInAppActivity"

    const-string v4, "ILibMode.mode_KPAD Show ID not exist"

    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/Config/Config;->LogE(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 185
    :cond_2
    sget-boolean v3, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v3, :cond_1

    const-string v3, "KTInAppActivity"

    const-string v4, "UserInfo.information = null"

    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/Config/Config;->LogD(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 163
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private getUserInfo(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1, "recipients"    # Ljava/lang/String;

    .prologue
    .line 206
    return-object p1
.end method

.method private notExistUserInfo()V
    .locals 3

    .prologue
    .line 253
    iget v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mLibMode:I

    packed-switch v0, :pswitch_data_0

    .line 261
    :goto_0
    return-void

    .line 258
    :pswitch_0
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    const-string v1, "CRAB2001"

    const-string v2, "ID or PhoneNumber \uc624\ub958"

    invoke-interface {v0, v1, v2}, Lcom/kt/olleh/inapp/OnInAppListener;->OnError(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 253
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private onServiceStart()V
    .locals 3

    .prologue
    .line 879
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.kt.olleh.inapp.IRemoteInapService"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 880
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->serviceConnection:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/kt/olleh/inapp/KTInAppActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 881
    return-void
.end method

.method private onServiceStop()V
    .locals 1

    .prologue
    .line 888
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->serviceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/kt/olleh/inapp/KTInAppActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 889
    return-void
.end method


# virtual methods
.method public getDIAllList(Ljava/lang/String;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;

    .prologue
    .line 365
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v1, :cond_0

    .line 367
    new-instance v1, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v1}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 369
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v1

    if-nez v1, :cond_1

    .line 382
    :goto_0
    return-void

    .line 374
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    .line 375
    .local v0, "userInfo":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 377
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 381
    :cond_2
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v2, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v1, p1, v0, v2, v3}, Lcom/kt/olleh/inapp/InApp;->getDIAllList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public getDIAllList(Ljava/lang/String;II)V
    .locals 7
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "page_size"    # I
    .param p3, "page"    # I

    .prologue
    .line 330
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 332
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 334
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 354
    :goto_0
    return-void

    .line 339
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v2

    .line 340
    .local v2, "userInfo":Ljava/lang/String;
    if-nez v2, :cond_2

    .line 342
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 346
    :cond_2
    if-lez p2, :cond_3

    if-gtz p3, :cond_4

    .line 348
    :cond_3
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v0, p1, v2, v1, v3}, Lcom/kt/olleh/inapp/InApp;->getDIAllList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0

    .line 352
    :cond_4
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v6, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v6}, Lcom/kt/olleh/inapp/InApp;->getDIAllList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public getDIDownloadableList(Ljava/lang/String;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;

    .prologue
    .line 517
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v1, :cond_0

    .line 519
    new-instance v1, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v1}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 521
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v1

    if-nez v1, :cond_1

    .line 534
    :goto_0
    return-void

    .line 526
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    .line 527
    .local v0, "userInfo":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 529
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 533
    :cond_2
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v2, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v1, p1, v0, v2, v3}, Lcom/kt/olleh/inapp/InApp;->getDIDownloadableList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public getDIGiftList(Ljava/lang/String;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;

    .prologue
    .line 432
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v1, :cond_0

    .line 434
    new-instance v1, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v1}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 436
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v1

    if-nez v1, :cond_1

    .line 449
    :goto_0
    return-void

    .line 441
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    .line 442
    .local v0, "userInfo":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 444
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 448
    :cond_2
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v2, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v1, p1, v0, v2, v3}, Lcom/kt/olleh/inapp/InApp;->getDIGiftList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public getDIGiftList(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "recipients"    # Ljava/lang/String;

    .prologue
    .line 396
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 398
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 400
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 421
    :goto_0
    return-void

    .line 405
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v2

    .line 406
    .local v2, "userInfo":Ljava/lang/String;
    if-nez v2, :cond_2

    .line 408
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 413
    :cond_2
    if-nez p2, :cond_3

    .line 415
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v0, p1, v2, v1, v3}, Lcom/kt/olleh/inapp/InApp;->getDIGiftList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0

    .line 419
    :cond_3
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/kt/olleh/inapp/InApp;->getDIGiftList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public getDIInformation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;

    .prologue
    .line 489
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 491
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 493
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 506
    :goto_0
    return-void

    .line 498
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    .line 499
    .local v3, "userInfo":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 501
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 505
    :cond_2
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v4, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v5, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/kt/olleh/inapp/InApp;->getDIInformation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public getDIPurchaseList(Ljava/lang/String;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;

    .prologue
    .line 300
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v1, :cond_0

    .line 302
    new-instance v1, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v1}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 304
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v1

    if-nez v1, :cond_1

    .line 317
    :goto_0
    return-void

    .line 309
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    .line 310
    .local v0, "userInfo":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 312
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 316
    :cond_2
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v2, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v1, p1, v0, v2, v3}, Lcom/kt/olleh/inapp/InApp;->getDIPurchaseList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public getDIReceiveList(Ljava/lang/String;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;

    .prologue
    .line 460
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v1, :cond_0

    .line 462
    new-instance v1, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v1}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 464
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v1

    if-nez v1, :cond_1

    .line 477
    :goto_0
    return-void

    .line 469
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    .line 470
    .local v0, "userInfo":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 472
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 476
    :cond_2
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v2, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v1, p1, v0, v2, v3}, Lcom/kt/olleh/inapp/InApp;->getDIReceiveList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public getDIUsableList(Ljava/lang/String;)V
    .locals 4
    .param p1, "app_id"    # Ljava/lang/String;

    .prologue
    .line 271
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v1, :cond_0

    .line 273
    new-instance v1, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v1}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 276
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v1

    if-nez v1, :cond_1

    .line 289
    :goto_0
    return-void

    .line 281
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    .line 282
    .local v0, "userInfo":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 284
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 288
    :cond_2
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v2, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v1, p1, v0, v2, v3}, Lcom/kt/olleh/inapp/InApp;->getDIUsableList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public init(Lcom/kt/olleh/inapp/OnInAppListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;

    .prologue
    .line 99
    const/4 v0, 0x0

    iput v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mLibMode:I

    .line 100
    const-string v0, "01"

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    .line 102
    iput-object p1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    .line 103
    return-void
.end method

.method public initListener()Z
    .locals 2

    .prologue
    .line 216
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    if-nez v0, :cond_0

    .line 218
    const-string v0, "KTInApp"

    const-string v1, "OnInAppListener \ubbf8\ub4f1\ub85d \uc624\ub958 \ubc1c\uc0dd"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    const/4 v0, 0x0

    .line 222
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 52
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 54
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 55
    .local v0, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 57
    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    sput v1, Lcom/kt/olleh/inapp/Config/Config;->Density:F

    .line 59
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 61
    new-instance v1, Lcom/kt/olleh/inapp/Purchase;

    invoke-direct {v1}, Lcom/kt/olleh/inapp/Purchase;-><init>()V

    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    .line 62
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/kt/olleh/inapp/Purchase;->setData(Ljava/lang/Object;)V

    .line 63
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v1, p0}, Lcom/kt/olleh/inapp/Purchase;->setContext(Landroid/content/Context;)V

    .line 65
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 80
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/Purchase;->onDestroy()V

    .line 83
    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-eqz v0, :cond_1

    .line 88
    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 91
    :cond_1
    const/4 v0, -0x1

    iput v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mLibMode:I

    .line 92
    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    .line 94
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 95
    return-void
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/Purchase;->getData()Ljava/lang/Object;

    move-result-object v0

    .line 75
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public purchase(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "applicationID"    # Ljava/lang/String;
    .param p2, "digitalID"    # Ljava/lang/String;

    .prologue
    .line 233
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/Purchase;->onDestroy()V

    .line 236
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    .line 239
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 246
    :goto_0
    return-void

    .line 244
    :cond_1
    new-instance v0, Lcom/kt/olleh/inapp/Purchase;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/Purchase;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    .line 245
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mPurchase:Lcom/kt/olleh/inapp/Purchase;

    iget-object v4, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    iget v5, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mLibMode:I

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/kt/olleh/inapp/Purchase;->onCreate(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;I)V

    goto :goto_0
.end method

.method public requestCancel()V
    .locals 1

    .prologue
    .line 867
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/InApp;->requestCancel()V

    .line 868
    return-void
.end method

.method public requestCheckCoin()V
    .locals 4

    .prologue
    .line 843
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v1, :cond_0

    .line 845
    new-instance v1, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v1}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 847
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v1

    if-nez v1, :cond_1

    .line 860
    :goto_0
    return-void

    .line 852
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    .line 853
    .local v0, "userInfo":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 855
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 859
    :cond_2
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v2, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v3, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v1, v0, v2, v3}, Lcom/kt/olleh/inapp/InApp;->requestCheckCoin(Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public requestCheckShowId(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "show_id"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;

    .prologue
    .line 818
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 820
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 822
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 828
    :goto_0
    return-void

    .line 827
    :cond_1
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v0, p1, p2, v1}, Lcom/kt/olleh/inapp/InApp;->requestCheckShowId(Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public requestDIApproveDown(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;

    .prologue
    .line 756
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 758
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 760
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 773
    :goto_0
    return-void

    .line 765
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    .line 766
    .local v3, "userInfo":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 768
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 772
    :cond_2
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v4, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v5, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/kt/olleh/inapp/InApp;->requestDIApproveDown(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public requestDIApproveUse(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;

    .prologue
    .line 727
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 729
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 731
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 744
    :goto_0
    return-void

    .line 736
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    .line 737
    .local v3, "userInfo":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 739
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 743
    :cond_2
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v4, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v5, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/kt/olleh/inapp/InApp;->requestDIApproveUse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public requestDIBuy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "buy_type"    # Ljava/lang/String;
    .param p4, "buy_pwd"    # Ljava/lang/String;

    .prologue
    .line 547
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 549
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 551
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 564
    :goto_0
    return-void

    .line 556
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    .line 557
    .local v3, "userInfo":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 559
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 563
    :cond_2
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v4, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v7, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v7}, Lcom/kt/olleh/inapp/InApp;->requestDIBuy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public requestDIBuyCancel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "tr_id"    # Ljava/lang/String;

    .prologue
    .line 610
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 612
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 614
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 627
    :goto_0
    return-void

    .line 619
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    .line 620
    .local v3, "userInfo":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 622
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 626
    :cond_2
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v4, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v6, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v6}, Lcom/kt/olleh/inapp/InApp;->requestDIBuyCancel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public requestDIGift(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "buy_type"    # Ljava/lang/String;
    .param p4, "buy_pwd"    # Ljava/lang/String;
    .param p5, "recipients"    # Ljava/lang/String;

    .prologue
    .line 667
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 669
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 671
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 684
    :goto_0
    return-void

    .line 676
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    .line 677
    .local v3, "userInfo":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 679
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 683
    :cond_2
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v4, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    invoke-direct {p0, p5}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v8}, Lcom/kt/olleh/inapp/InApp;->requestDIGift(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public requestDIReBuy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "buy_type"    # Ljava/lang/String;
    .param p4, "buy_pwd"    # Ljava/lang/String;

    .prologue
    .line 580
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 582
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 584
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 597
    :goto_0
    return-void

    .line 589
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    .line 590
    .local v3, "userInfo":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 592
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 596
    :cond_2
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v4, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v7, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v7}, Lcom/kt/olleh/inapp/InApp;->requestDIReBuy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public requestDIReGift(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "buy_type"    # Ljava/lang/String;
    .param p4, "buy_pwd"    # Ljava/lang/String;
    .param p5, "recipients"    # Ljava/lang/String;

    .prologue
    .line 698
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 700
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 702
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 715
    :goto_0
    return-void

    .line 707
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    .line 708
    .local v3, "userInfo":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 710
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 714
    :cond_2
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v4, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    invoke-direct {p0, p5}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v8}, Lcom/kt/olleh/inapp/InApp;->requestDIReGift(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public requestDIesBuy(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "iid"    # Ljava/lang/String;
    .param p2, "appid"    # Ljava/lang/String;

    .prologue
    .line 638
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v1, :cond_0

    .line 640
    new-instance v1, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v1}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 642
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v1

    if-nez v1, :cond_1

    .line 653
    :goto_0
    return-void

    .line 646
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    .line 647
    .local v0, "userInfo":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 649
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 652
    :cond_2
    iget-object v1, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v2, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v1, p1, p2, v0, v2}, Lcom/kt/olleh/inapp/InApp;->requestDIesBuy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public requestDIgetFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "file_name"    # Ljava/lang/String;
    .param p2, "mime_type"    # Ljava/lang/String;

    .prologue
    .line 787
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 789
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 791
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->initListener()Z

    move-result v0

    if-nez v0, :cond_1

    .line 804
    :goto_0
    return-void

    .line 796
    :cond_1
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    .line 797
    .local v3, "userInfo":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 799
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->notExistUserInfo()V

    goto :goto_0

    .line 803
    :cond_2
    iget-object v0, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v4, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mAuthen:Ljava/lang/String;

    iget-object v5, p0, Lcom/kt/olleh/inapp/KTInAppActivity;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/kt/olleh/inapp/InApp;->requestDIgetFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    goto :goto_0
.end method

.method public settingSoIPNumber()V
    .locals 0

    .prologue
    .line 872
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;->onServiceStart()V

    .line 873
    return-void
.end method
