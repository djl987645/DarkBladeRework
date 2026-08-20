.class public Lcom/kt/olleh/inapp/Purchase;
.super Ljava/lang/Object;
.source "Purchase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/kt/olleh/inapp/Purchase$Data;
    }
.end annotation


# static fields
.field public static Dialog_Mode:I

.field public static Pay_Alert_Mode:I


# instance fields
.field private final Dialog_Alert:I

.field private final Dialog_Dismiss:I

.field private final Dialog_List:I

.field private final Dialog_Loding:I

.field private final Dialog_Login:I

.field private final Dialog_Pay:I

.field private final Dialog_Select:I

.field private final Pay_Alert_Mode_01:I

.field private final Pay_Alert_Mode_02:I

.field private final Pay_Alert_Mode_03:I

.field private final Pay_Alert_Mode_04:I

.field public final TAG:Ljava/lang/String;

.field public handler:Landroid/os/Handler;

.field private mApplicationID:Ljava/lang/String;

.field private mAuthen:Ljava/lang/String;

.field private mCardName:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDialog:Landroid/app/Dialog;

.field private mDialog_BtnCnt:I

.field private mDialog_Btn_Text_01:Ljava/lang/String;

.field private mDialog_Btn_Text_02:Ljava/lang/String;

.field private mDialog_Message:Ljava/lang/String;

.field private mDialog_Title:Ljava/lang/String;

.field private mDialog_progress:Lcom/kt/olleh/inapp/dialog/DialogProgress;

.field private mDigitalID:Ljava/lang/String;

.field private mInApp:Lcom/kt/olleh/inapp/InApp;

.field mInAppListener:Lcom/kt/olleh/inapp/OnInAppListener;

.field private mIsPayInformation:Z

.field private mIsPayMessage:Z

.field private mItem_Name:Ljava/lang/String;

.field private mItem_Price:I

.field private mLibMode:I

.field private mListener:Lcom/kt/olleh/inapp/OnInAppListener;

.field private mLoginDialog:Lcom/kt/olleh/inapp/dialog/DialogLogin;

.field private mPay_Type:Ljava/lang/String;

.field private mTr_ID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 57
    sput v0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    .line 58
    sput v0, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode:I

    .line 33
    return-void
.end method

.method constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Alert:I

    .line 45
    const/16 v0, 0x3e9

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->Dialog_List:I

    .line 46
    const/16 v0, 0x3ea

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Pay:I

    .line 47
    const/16 v0, 0x3eb

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Loding:I

    .line 48
    const/16 v0, 0x3ec

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Dismiss:I

    .line 49
    const/16 v0, 0x3ed

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Login:I

    .line 50
    const/16 v0, 0x3ee

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Select:I

    .line 52
    const/16 v0, 0x3f3

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode_01:I

    .line 53
    const/16 v0, 0x3f4

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode_02:I

    .line 54
    const/16 v0, 0x3f5

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode_03:I

    .line 55
    const/16 v0, 0x3f6

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode_04:I

    .line 60
    iput v2, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_BtnCnt:I

    .line 61
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Title:Ljava/lang/String;

    .line 62
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    .line 63
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_01:Ljava/lang/String;

    .line 64
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_02:Ljava/lang/String;

    .line 65
    iput-boolean v3, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayInformation:Z

    .line 66
    iput-boolean v3, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayMessage:Z

    .line 67
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mCardName:Ljava/lang/String;

    .line 69
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Name:Ljava/lang/String;

    .line 70
    iput v2, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Price:I

    .line 71
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mPay_Type:Ljava/lang/String;

    .line 81
    const-string v0, "KTInAppActivity"

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->TAG:Ljava/lang/String;

    .line 590
    new-instance v0, Lcom/kt/olleh/inapp/Purchase$1;

    invoke-direct {v0, p0}, Lcom/kt/olleh/inapp/Purchase$1;-><init>(Lcom/kt/olleh/inapp/Purchase;)V

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->handler:Landroid/os/Handler;

    .line 766
    new-instance v0, Lcom/kt/olleh/inapp/Purchase$2;

    invoke-direct {v0, p0}, Lcom/kt/olleh/inapp/Purchase$2;-><init>(Lcom/kt/olleh/inapp/Purchase;)V

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mInAppListener:Lcom/kt/olleh/inapp/OnInAppListener;

    .line 85
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 86
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mApplicationID:Ljava/lang/String;

    .line 87
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDigitalID:Ljava/lang/String;

    .line 88
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    .line 89
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mTr_ID:Ljava/lang/String;

    .line 90
    iput v2, p0, Lcom/kt/olleh/inapp/Purchase;->mLibMode:I

    .line 91
    return-void
.end method

.method static synthetic access$0(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/dialog/DialogProgress;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_progress:Lcom/kt/olleh/inapp/dialog/DialogProgress;

    return-object v0
.end method

.method static synthetic access$1(Lcom/kt/olleh/inapp/Purchase;Lcom/kt/olleh/inapp/dialog/DialogProgress;)V
    .locals 0

    .prologue
    .line 74
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_progress:Lcom/kt/olleh/inapp/dialog/DialogProgress;

    return-void
.end method

.method static synthetic access$10(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/OnInAppListener;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    return-object v0
.end method

.method static synthetic access$11(Lcom/kt/olleh/inapp/Purchase;)Lcom/kt/olleh/inapp/dialog/DialogLogin;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mLoginDialog:Lcom/kt/olleh/inapp/dialog/DialogLogin;

    return-object v0
.end method

.method static synthetic access$12(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 77
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase;->mAuthen:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$13(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase;->mPay_Type:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$14(Lcom/kt/olleh/inapp/Purchase;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mApplicationID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$15(Lcom/kt/olleh/inapp/Purchase;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDigitalID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$16(Lcom/kt/olleh/inapp/Purchase;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mTr_ID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/kt/olleh/inapp/Purchase;I)V
    .locals 0

    .prologue
    .line 70
    iput p1, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Price:I

    return-void
.end method

.method static synthetic access$3(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 69
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Name:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$4(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$5(Lcom/kt/olleh/inapp/Purchase;I)V
    .locals 0

    .prologue
    .line 60
    iput p1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_BtnCnt:I

    return-void
.end method

.method static synthetic access$6(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 63
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_01:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$7(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 64
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_02:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$8(Lcom/kt/olleh/inapp/Purchase;Z)V
    .locals 0

    .prologue
    .line 65
    iput-boolean p1, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayInformation:Z

    return-void
.end method

.method static synthetic access$9(Lcom/kt/olleh/inapp/Purchase;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 75
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase;->mTr_ID:Ljava/lang/String;

    return-void
.end method

.method private getUserInfo()Ljava/lang/String;
    .locals 6

    .prologue
    .line 677
    const/4 v2, 0x0

    .line 678
    .local v2, "userInfo":Ljava/lang/String;
    sget-object v3, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 680
    iget v3, p0, Lcom/kt/olleh/inapp/Purchase;->mLibMode:I

    packed-switch v3, :pswitch_data_0

    .line 696
    :cond_0
    :goto_0
    sget-object v3, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 698
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

    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/Config/Config;->LogE(Ljava/lang/String;Ljava/lang/String;)V

    .line 700
    :cond_1
    sget-object v2, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    .line 702
    return-object v2

    .line 683
    :pswitch_0
    iget-object v3, p0, Lcom/kt/olleh/inapp/Purchase;->mContext:Landroid/content/Context;

    const-string v4, "phone"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 684
    .local v1, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v0

    .line 685
    .local v0, "phoneNo":Ljava/lang/String;
    sput-object v0, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    goto :goto_0

    .line 688
    .end local v0    # "phoneNo":Ljava/lang/String;
    .end local v1    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :pswitch_1
    sget-boolean v3, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "KTInAppActivity"

    const-string v4, "ILibMode.mode_SoIP number not exist"

    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/Config/Config;->LogE(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 691
    :pswitch_2
    sget-boolean v3, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "KTInAppActivity"

    const-string v4, "ILibMode.mode_KPAD Show ID not exist"

    invoke-static {v3, v4}, Lcom/kt/olleh/inapp/Config/Config;->LogE(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 680
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public AlertDialog()V
    .locals 4

    .prologue
    .line 251
    const/16 v1, 0x3e8

    sput v1, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    .line 253
    new-instance v0, Lcom/kt/olleh/inapp/dialog/DialogAlert;

    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_BtnCnt:I

    invoke-direct {v0, v1, v2}, Lcom/kt/olleh/inapp/dialog/DialogAlert;-><init>(Landroid/content/Context;I)V

    .line 254
    .local v0, "dialog":Lcom/kt/olleh/inapp/dialog/DialogAlert;
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/dialog/DialogAlert;->setTitle(Ljava/lang/CharSequence;)V

    .line 255
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/dialog/DialogAlert;->setMessage(Ljava/lang/String;)V

    .line 256
    const/4 v1, 0x0

    const-string v2, "\ud655\uc778"

    new-instance v3, Lcom/kt/olleh/inapp/Purchase$7;

    invoke-direct {v3, p0, v0}, Lcom/kt/olleh/inapp/Purchase$7;-><init>(Lcom/kt/olleh/inapp/Purchase;Landroid/app/Dialog;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/kt/olleh/inapp/dialog/DialogAlert;->setButton(ILjava/lang/String;Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V

    .line 263
    const/4 v1, 0x1

    const-string v2, "\ucde8\uc18c"

    new-instance v3, Lcom/kt/olleh/inapp/Purchase$8;

    invoke-direct {v3, p0, v0}, Lcom/kt/olleh/inapp/Purchase$8;-><init>(Lcom/kt/olleh/inapp/Purchase;Landroid/app/Dialog;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/kt/olleh/inapp/dialog/DialogAlert;->setButton(ILjava/lang/String;Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V

    .line 270
    invoke-virtual {v0}, Lcom/kt/olleh/inapp/dialog/DialogAlert;->show()V

    .line 272
    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog:Landroid/app/Dialog;

    .line 273
    return-void
.end method

.method public LodingDialog()V
    .locals 3

    .prologue
    .line 489
    const/16 v0, 0x3eb

    sput v0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    .line 491
    new-instance v0, Lcom/kt/olleh/inapp/dialog/DialogProgress;

    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/kt/olleh/inapp/dialog/DialogProgress;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_progress:Lcom/kt/olleh/inapp/dialog/DialogProgress;

    .line 504
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_progress:Lcom/kt/olleh/inapp/dialog/DialogProgress;

    new-instance v1, Lcom/kt/olleh/inapp/Purchase$12;

    invoke-direct {v1, p0}, Lcom/kt/olleh/inapp/Purchase$12;-><init>(Lcom/kt/olleh/inapp/Purchase;)V

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/dialog/DialogProgress;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 529
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_progress:Lcom/kt/olleh/inapp/dialog/DialogProgress;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/dialog/DialogProgress;->show()V

    .line 530
    return-void
.end method

.method public LoginDialog()V
    .locals 4

    .prologue
    .line 166
    const/16 v0, 0x3ed

    sput v0, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    .line 168
    new-instance v0, Lcom/kt/olleh/inapp/dialog/DialogLogin;

    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/kt/olleh/inapp/dialog/DialogLogin;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mLoginDialog:Lcom/kt/olleh/inapp/dialog/DialogLogin;

    .line 170
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mLoginDialog:Lcom/kt/olleh/inapp/dialog/DialogLogin;

    const-string v1, "Olleh.com \ub85c\uadf8\uc778"

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->setTitle(Ljava/lang/CharSequence;)V

    .line 171
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mLoginDialog:Lcom/kt/olleh/inapp/dialog/DialogLogin;

    const/4 v1, 0x0

    new-instance v2, Lcom/kt/olleh/inapp/Purchase$3;

    iget-object v3, p0, Lcom/kt/olleh/inapp/Purchase;->mLoginDialog:Lcom/kt/olleh/inapp/dialog/DialogLogin;

    invoke-direct {v2, p0, v3}, Lcom/kt/olleh/inapp/Purchase$3;-><init>(Lcom/kt/olleh/inapp/Purchase;Landroid/app/Dialog;)V

    invoke-virtual {v0, v1, v2}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->setButton(ILcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V

    .line 184
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mLoginDialog:Lcom/kt/olleh/inapp/dialog/DialogLogin;

    const/4 v1, 0x1

    new-instance v2, Lcom/kt/olleh/inapp/Purchase$4;

    iget-object v3, p0, Lcom/kt/olleh/inapp/Purchase;->mLoginDialog:Lcom/kt/olleh/inapp/dialog/DialogLogin;

    invoke-direct {v2, p0, v3}, Lcom/kt/olleh/inapp/Purchase$4;-><init>(Lcom/kt/olleh/inapp/Purchase;Landroid/app/Dialog;)V

    invoke-virtual {v0, v1, v2}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->setButton(ILcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V

    .line 191
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mLoginDialog:Lcom/kt/olleh/inapp/dialog/DialogLogin;

    invoke-virtual {v0}, Lcom/kt/olleh/inapp/dialog/DialogLogin;->show()V

    .line 193
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mLoginDialog:Lcom/kt/olleh/inapp/dialog/DialogLogin;

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog:Landroid/app/Dialog;

    .line 194
    return-void
.end method

.method public PayDialog(I)V
    .locals 11
    .param p1, "mode"    # I

    .prologue
    .line 333
    const/16 v7, 0x3ea

    sput v7, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    .line 335
    new-instance v0, Lcom/kt/olleh/inapp/dialog/DialogPay;

    iget-object v7, p0, Lcom/kt/olleh/inapp/Purchase;->mContext:Landroid/content/Context;

    iget v8, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_BtnCnt:I

    const-string v9, "/layout/dialog_pay.xml"

    invoke-direct {v0, v7, v8, v9}, Lcom/kt/olleh/inapp/dialog/DialogPay;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    .line 341
    .local v0, "dialog":Lcom/kt/olleh/inapp/dialog/DialogPay;
    const/16 v7, 0x3f6

    if-ne p1, v7, :cond_0

    .line 343
    const-string v7, "\uacb0\uc81c \ud655\uc778"

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setTitle(Ljava/lang/CharSequence;)V

    .line 344
    iget-object v7, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setMessage(Ljava/lang/String;)V

    .line 346
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setBgColor(Z)V

    .line 397
    :goto_0
    const/4 v7, 0x0

    iget-object v8, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_01:Ljava/lang/String;

    new-instance v9, Lcom/kt/olleh/inapp/Purchase$9;

    invoke-direct {v9, p0, v0, p1}, Lcom/kt/olleh/inapp/Purchase$9;-><init>(Lcom/kt/olleh/inapp/Purchase;Landroid/app/Dialog;I)V

    invoke-virtual {v0, v7, v8, v9}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setButton(ILjava/lang/String;Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V

    .line 436
    const/4 v7, 0x1

    iget-object v8, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_02:Ljava/lang/String;

    new-instance v9, Lcom/kt/olleh/inapp/Purchase$10;

    invoke-direct {v9, p0, v0, p1}, Lcom/kt/olleh/inapp/Purchase$10;-><init>(Lcom/kt/olleh/inapp/Purchase;Landroid/app/Dialog;I)V

    invoke-virtual {v0, v7, v8, v9}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setButton(ILjava/lang/String;Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V

    .line 452
    new-instance v7, Lcom/kt/olleh/inapp/Purchase$11;

    invoke-direct {v7, p0, p1}, Lcom/kt/olleh/inapp/Purchase$11;-><init>(Lcom/kt/olleh/inapp/Purchase;I)V

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 474
    iget-boolean v7, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayInformation:Z

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayInformation(Z)V

    .line 475
    iget-boolean v7, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayMessage:Z

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayMessage(Z)V

    .line 476
    invoke-virtual {v0}, Lcom/kt/olleh/inapp/dialog/DialogPay;->show()V

    .line 478
    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog:Landroid/app/Dialog;

    .line 479
    return-void

    .line 348
    :cond_0
    const/16 v7, 0x3f4

    if-ne p1, v7, :cond_1

    .line 350
    const-string v7, "\uacb0\uc81c \ud655\uc778"

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setTitle(Ljava/lang/CharSequence;)V

    .line 351
    iget-object v7, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setMessage(Ljava/lang/String;)V

    .line 353
    iget v7, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Price:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/kt/olleh/inapp/Purchase;->getPriceFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 355
    .local v6, "price":Ljava/lang/String;
    const-string v7, "%s\uc744 \uacb0\uc81c\ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v6, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 357
    .local v1, "msg":Ljava/lang/String;
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayNameTitle(Z)V

    .line 358
    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayNameMessage(ILjava/lang/String;)V

    .line 359
    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayNameMessage(ILjava/lang/String;)V

    .line 360
    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayMoneyMessage(Ljava/lang/String;)V

    .line 361
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayTypeMessage(Ljava/lang/String;)V

    .line 363
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayMessage:Z

    .line 364
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayInformation:Z

    .line 366
    const/4 v7, 0x1

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setBgColor(Z)V

    goto :goto_0

    .line 370
    .end local v1    # "msg":Ljava/lang/String;
    .end local v6    # "price":Ljava/lang/String;
    :cond_1
    const-string v7, "\uacb0\uc81c \ud655\uc778"

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setTitle(Ljava/lang/CharSequence;)V

    .line 371
    iget-object v7, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setMessage(Ljava/lang/String;)V

    .line 373
    iget v7, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Price:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/kt/olleh/inapp/Purchase;->getPriceFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 375
    .restart local v6    # "price":Ljava/lang/String;
    const/4 v7, 0x1

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayNameTitle(Z)V

    .line 376
    iget-object v7, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Name:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    const/16 v8, 0xc

    if-le v7, v8, :cond_2

    .line 378
    iget-object v7, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Name:Ljava/lang/String;

    const/4 v8, 0x0

    const/16 v9, 0xc

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 379
    .local v2, "msgPayItemName1":Ljava/lang/String;
    iget-object v7, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Name:Ljava/lang/String;

    const/16 v8, 0xc

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 381
    .local v3, "msgPayItemName2":Ljava/lang/String;
    const/4 v7, 0x1

    invoke-virtual {v0, v7, v2}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayNameMessage(ILjava/lang/String;)V

    .line 382
    const/4 v7, 0x2

    invoke-virtual {v0, v7, v3}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayNameMessage(ILjava/lang/String;)V

    .line 389
    .end local v2    # "msgPayItemName1":Ljava/lang/String;
    .end local v3    # "msgPayItemName2":Ljava/lang/String;
    :goto_1
    const-string v7, "\uacb0\uc81c\uae08\uc561:%s(\ubd80\uac00\uc138\ubcc4\ub3c4)"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v6, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 390
    .local v4, "msgPayMoney":Ljava/lang/String;
    invoke-virtual {v0, v4}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayMoneyMessage(Ljava/lang/String;)V

    .line 391
    const-string v7, "\uacb0\uc81c\ubc29\uc2dd:%s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/kt/olleh/inapp/Purchase;->mPay_Type:Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 392
    .local v5, "msgPayType":Ljava/lang/String;
    invoke-virtual {v0, v5}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayTypeMessage(Ljava/lang/String;)V

    .line 394
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayMessage:Z

    .line 395
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setBgColor(Z)V

    goto/16 :goto_0

    .line 386
    .end local v4    # "msgPayMoney":Ljava/lang/String;
    .end local v5    # "msgPayType":Ljava/lang/String;
    :cond_2
    const/4 v7, 0x1

    iget-object v8, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Name:Ljava/lang/String;

    invoke-virtual {v0, v7, v8}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayNameMessage(ILjava/lang/String;)V

    .line 387
    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Lcom/kt/olleh/inapp/dialog/DialogPay;->setPayNameMessage(ILjava/lang/String;)V

    goto :goto_1
.end method

.method public SelectDialog()V
    .locals 2

    .prologue
    .line 199
    const/16 v1, 0x3ee

    sput v1, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    .line 201
    new-instance v0, Lcom/kt/olleh/inapp/dialog/DialogSelect;

    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/kt/olleh/inapp/dialog/DialogSelect;-><init>(Landroid/content/Context;)V

    .line 203
    .local v0, "dialog":Lcom/kt/olleh/inapp/dialog/DialogSelect;
    new-instance v1, Lcom/kt/olleh/inapp/Purchase$5;

    invoke-direct {v1, p0, v0}, Lcom/kt/olleh/inapp/Purchase$5;-><init>(Lcom/kt/olleh/inapp/Purchase;Landroid/app/Dialog;)V

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->setOnItemClickListener(Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V

    .line 236
    new-instance v1, Lcom/kt/olleh/inapp/Purchase$6;

    invoke-direct {v1, p0, v0}, Lcom/kt/olleh/inapp/Purchase$6;-><init>(Lcom/kt/olleh/inapp/Purchase;Landroid/app/Dialog;)V

    invoke-virtual {v0, v1}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->setOnCancelListener(Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;)V

    .line 244
    invoke-virtual {v0}, Lcom/kt/olleh/inapp/dialog/DialogSelect;->show()V

    .line 246
    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog:Landroid/app/Dialog;

    .line 247
    return-void
.end method

.method public SendMessage(I)V
    .locals 2
    .param p1, "what"    # I

    .prologue
    .line 637
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->handler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 638
    .local v0, "msg":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 639
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 640
    return-void
.end method

.method public getDIInformation(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;

    .prologue
    .line 715
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 717
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 720
    :cond_0
    invoke-direct {p0}, Lcom/kt/olleh/inapp/Purchase;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    .line 722
    .local v3, "userInfo":Ljava/lang/String;
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v4, p0, Lcom/kt/olleh/inapp/Purchase;->mAuthen:Ljava/lang/String;

    iget-object v5, p0, Lcom/kt/olleh/inapp/Purchase;->mInAppListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/kt/olleh/inapp/InApp;->getDIInformation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    .line 723
    return-void
.end method

.method public getData()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 558
    new-instance v0, Lcom/kt/olleh/inapp/Purchase$Data;

    invoke-direct {v0, p0}, Lcom/kt/olleh/inapp/Purchase$Data;-><init>(Lcom/kt/olleh/inapp/Purchase;)V

    .line 559
    .local v0, "data":Lcom/kt/olleh/inapp/Purchase$Data;
    iget v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_BtnCnt:I

    iput v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Dialog_BtnCnt:I

    .line 560
    sget v1, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    iput v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Dialog_Mode:I

    .line 561
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    iput-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Dialog_Message:Ljava/lang/String;

    .line 562
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_01:Ljava/lang/String;

    iput-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Dialog_Btn_Text_01:Ljava/lang/String;

    .line 563
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_02:Ljava/lang/String;

    iput-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Dialog_Btn_Text_02:Ljava/lang/String;

    .line 564
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mPay_Type:Ljava/lang/String;

    iput-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Pay_Type:Ljava/lang/String;

    .line 565
    iget-boolean v1, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayInformation:Z

    iput-boolean v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->isPayInformation:Z

    .line 566
    iget-boolean v1, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayMessage:Z

    iput-boolean v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->isPayMessage:Z

    .line 567
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mCardName:Ljava/lang/String;

    iput-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->CardName:Ljava/lang/String;

    .line 568
    sget v1, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode:I

    iput v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Pay_Alert_Mode:I

    .line 569
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Name:Ljava/lang/String;

    iput-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Item_Name:Ljava/lang/String;

    .line 570
    iget v1, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Price:I

    iput v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Item_Price:I

    .line 572
    return-object v0
.end method

.method public getPriceFormat(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "pr"    # Ljava/lang/String;

    .prologue
    .line 854
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 855
    .local v4, "sb":Ljava/lang/StringBuffer;
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 857
    .local v3, "price":I
    int-to-double v1, v3

    .line 858
    .local v1, "num":D
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v5, "#,##0"

    invoke-direct {v0, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 860
    .local v0, "df":Ljava/text/DecimalFormat;
    invoke-virtual {v0, v1, v2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 862
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "\uc6d0"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public onCreate(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "applicationID"    # Ljava/lang/String;
    .param p3, "digitalID"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/kt/olleh/inapp/OnInAppListener;
    .param p5, "libMode"    # I

    .prologue
    .line 95
    iput-object p2, p0, Lcom/kt/olleh/inapp/Purchase;->mApplicationID:Ljava/lang/String;

    .line 96
    iput-object p3, p0, Lcom/kt/olleh/inapp/Purchase;->mDigitalID:Ljava/lang/String;

    .line 97
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase;->mContext:Landroid/content/Context;

    .line 98
    iput-object p4, p0, Lcom/kt/olleh/inapp/Purchase;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    .line 99
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mTr_ID:Ljava/lang/String;

    .line 100
    iput p5, p0, Lcom/kt/olleh/inapp/Purchase;->mLibMode:I

    .line 102
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 104
    iget v0, p0, Lcom/kt/olleh/inapp/Purchase;->mLibMode:I

    packed-switch v0, :pswitch_data_0

    .line 132
    :goto_0
    return-void

    .line 107
    :pswitch_0
    const-string v0, "01"

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mAuthen:Ljava/lang/String;

    .line 108
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/Purchase;->purchaseGetInfo()V

    goto :goto_0

    .line 111
    :pswitch_1
    const-string v0, "02"

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mAuthen:Ljava/lang/String;

    .line 112
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/Purchase;->purchaseGetInfo()V

    goto :goto_0

    .line 115
    :pswitch_2
    const-string v0, "03"

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mAuthen:Ljava/lang/String;

    .line 116
    sget-object v0, Lcom/kt/olleh/inapp/InAppSettings;->UserInfo:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 119
    const/16 v0, 0x3ed

    invoke-virtual {p0, v0}, Lcom/kt/olleh/inapp/Purchase;->SendMessage(I)V

    goto :goto_0

    .line 128
    :cond_0
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/Purchase;->purchaseGetInfo()V

    goto :goto_0

    .line 104
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 135
    iput v2, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_BtnCnt:I

    .line 136
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Title:Ljava/lang/String;

    .line 137
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    .line 138
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_01:Ljava/lang/String;

    .line 139
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_02:Ljava/lang/String;

    .line 140
    iput-boolean v0, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayInformation:Z

    .line 141
    iput-boolean v0, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayMessage:Z

    .line 142
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mCardName:Ljava/lang/String;

    .line 143
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Name:Ljava/lang/String;

    .line 144
    iput v2, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Price:I

    .line 145
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mPay_Type:Ljava/lang/String;

    .line 146
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mAuthen:Ljava/lang/String;

    .line 148
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_1

    .line 150
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 152
    :cond_0
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog:Landroid/app/Dialog;

    .line 155
    :cond_1
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mContext:Landroid/content/Context;

    .line 156
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 157
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mApplicationID:Ljava/lang/String;

    .line 158
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDigitalID:Ljava/lang/String;

    .line 159
    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    .line 160
    iput v2, p0, Lcom/kt/olleh/inapp/Purchase;->mLibMode:I

    .line 161
    return-void
.end method

.method public purchaseErrorDialog(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 659
    const/16 v0, 0x3f6

    sput v0, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode:I

    .line 660
    const/4 v0, 0x1

    iput v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_BtnCnt:I

    .line 661
    const-string v0, "\ud655\uc778"

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_01:Ljava/lang/String;

    .line 662
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    .line 663
    iput-boolean v1, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayInformation:Z

    .line 664
    iput-boolean v1, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayMessage:Z

    .line 666
    const/16 v0, 0x3ea

    invoke-virtual {p0, v0}, Lcom/kt/olleh/inapp/Purchase;->SendMessage(I)V

    .line 667
    return-void
.end method

.method public purchaseGetInfo()V
    .locals 2

    .prologue
    .line 650
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mApplicationID:Ljava/lang/String;

    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDigitalID:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/kt/olleh/inapp/Purchase;->getDIInformation(Ljava/lang/String;Ljava/lang/String;)V

    .line 651
    const-string v0, "\ucde8\uc18c"

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_01:Ljava/lang/String;

    .line 652
    const-string v0, "\ucc98\ub9ac \uc911..."

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    .line 653
    const-string v0, "\ud578\ub4dc\ud3f0 \uacb0\uc81c"

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mPay_Type:Ljava/lang/String;

    .line 654
    const/16 v0, 0x3eb

    invoke-virtual {p0, v0}, Lcom/kt/olleh/inapp/Purchase;->SendMessage(I)V

    .line 655
    return-void
.end method

.method public requestCheckShowId(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "show_id"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;

    .prologue
    .line 758
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 760
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 763
    :cond_0
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mInAppListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {v0, p1, p2, v1}, Lcom/kt/olleh/inapp/InApp;->requestCheckShowId(Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    .line 764
    return-void
.end method

.method public requestDIBuy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "app_id"    # Ljava/lang/String;
    .param p2, "di_id"    # Ljava/lang/String;
    .param p3, "buy_type"    # Ljava/lang/String;
    .param p4, "buy_pwd"    # Ljava/lang/String;

    .prologue
    .line 736
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    if-nez v0, :cond_0

    .line 738
    new-instance v0, Lcom/kt/olleh/inapp/InApp;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/InApp;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    .line 741
    :cond_0
    invoke-direct {p0}, Lcom/kt/olleh/inapp/Purchase;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    .line 743
    .local v3, "userInfo":Ljava/lang/String;
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mInApp:Lcom/kt/olleh/inapp/InApp;

    iget-object v4, p0, Lcom/kt/olleh/inapp/Purchase;->mAuthen:Ljava/lang/String;

    iget-object v7, p0, Lcom/kt/olleh/inapp/Purchase;->mInAppListener:Lcom/kt/olleh/inapp/OnInAppListener;

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v7}, Lcom/kt/olleh/inapp/InApp;->requestDIBuy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/kt/olleh/inapp/OnInAppListener;)V

    .line 744
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 644
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase;->mContext:Landroid/content/Context;

    .line 645
    return-void
.end method

.method public setData(Ljava/lang/Object;)V
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 534
    move-object v0, p1

    check-cast v0, Lcom/kt/olleh/inapp/Purchase$Data;

    .line 536
    .local v0, "data":Lcom/kt/olleh/inapp/Purchase$Data;
    if-eqz v0, :cond_0

    .line 538
    iget v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Dialog_BtnCnt:I

    iput v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_BtnCnt:I

    .line 539
    iget v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Dialog_Mode:I

    sput v1, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    .line 540
    iget-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Dialog_Message:Ljava/lang/String;

    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Message:Ljava/lang/String;

    .line 541
    iget-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Dialog_Btn_Text_01:Ljava/lang/String;

    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_01:Ljava/lang/String;

    .line 542
    iget-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Dialog_Btn_Text_02:Ljava/lang/String;

    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mDialog_Btn_Text_02:Ljava/lang/String;

    .line 543
    iget-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Pay_Type:Ljava/lang/String;

    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mPay_Type:Ljava/lang/String;

    .line 544
    iget-boolean v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->isPayInformation:Z

    iput-boolean v1, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayInformation:Z

    .line 545
    iget-boolean v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->isPayMessage:Z

    iput-boolean v1, p0, Lcom/kt/olleh/inapp/Purchase;->mIsPayMessage:Z

    .line 546
    iget-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->CardName:Ljava/lang/String;

    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mCardName:Ljava/lang/String;

    .line 547
    iget v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Pay_Alert_Mode:I

    sput v1, Lcom/kt/olleh/inapp/Purchase;->Pay_Alert_Mode:I

    .line 548
    iget-object v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Item_Name:Ljava/lang/String;

    iput-object v1, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Name:Ljava/lang/String;

    .line 549
    iget v1, v0, Lcom/kt/olleh/inapp/Purchase$Data;->Item_Price:I

    iput v1, p0, Lcom/kt/olleh/inapp/Purchase;->mItem_Price:I

    .line 551
    sget v1, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    if-lez v1, :cond_0

    .line 552
    sget v1, Lcom/kt/olleh/inapp/Purchase;->Dialog_Mode:I

    invoke-virtual {p0, v1}, Lcom/kt/olleh/inapp/Purchase;->SendMessage(I)V

    .line 554
    :cond_0
    return-void
.end method

.method public userCancelResponse()V
    .locals 3

    .prologue
    .line 483
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    if-eqz v0, :cond_0

    .line 484
    iget-object v0, p0, Lcom/kt/olleh/inapp/Purchase;->mListener:Lcom/kt/olleh/inapp/OnInAppListener;

    const-string v1, "I001"

    const-string v2, "\uc0ac\uc6a9\uc790 \uc694\uccad\uc5d0 \uc758\ud55c \ucde8\uc18c"

    invoke-interface {v0, v1, v2}, Lcom/kt/olleh/inapp/OnInAppListener;->OnError(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    :cond_0
    return-void
.end method
