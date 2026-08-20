.class public Lcom/beyond/KTPurchaseActivity;
.super Lcom/kt/olleh/inapp/KTInAppActivity;
.source "KTPurchaseActivity.java"


# static fields
.field public static final BUY_ITEM:I = 0x1f6


# instance fields
.field mInAPInformationListener:Lcom/kt/olleh/inapp/OnInAppListener;

.field s_set_AppID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/kt/olleh/inapp/KTInAppActivity;-><init>()V

    .line 56
    new-instance v0, Lcom/beyond/KTPurchaseActivity$1;

    invoke-direct {v0, p0}, Lcom/beyond/KTPurchaseActivity$1;-><init>(Lcom/beyond/KTPurchaseActivity;)V

    iput-object v0, p0, Lcom/beyond/KTPurchaseActivity;->mInAPInformationListener:Lcom/kt/olleh/inapp/OnInAppListener;

    .line 17
    return-void
.end method

.method static synthetic access$0(Lcom/beyond/KTPurchaseActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 120
    invoke-direct {p0, p1, p2}, Lcom/beyond/KTPurchaseActivity;->showDialog(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private showDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "result"    # Ljava/lang/String;

    .prologue
    .line 122
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 123
    .local v0, "b":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 124
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 125
    const-string v1, "OK"

    new-instance v2, Lcom/beyond/KTPurchaseActivity$2;

    invoke-direct {v2, p0}, Lcom/beyond/KTPurchaseActivity$2;-><init>(Lcom/beyond/KTPurchaseActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 139
    new-instance v1, Lcom/beyond/KTPurchaseActivity$3;

    invoke-direct {v1, p0}, Lcom/beyond/KTPurchaseActivity$3;-><init>(Lcom/beyond/KTPurchaseActivity;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    .line 161
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 162
    return-void
.end method


# virtual methods
.method public KT_Purchase(Ljava/lang/String;)V
    .locals 3
    .param p1, "_itemid"    # Ljava/lang/String;

    .prologue
    .line 41
    move-object v0, p1

    .line 42
    .local v0, "_as":Ljava/lang/String;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 43
    .local v1, "msg":Landroid/os/Message;
    const/16 v2, 0x1f6

    iput v2, v1, Landroid/os/Message;->what:I

    .line 44
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 45
    invoke-static {}, Lcom/beyond/BeyondActivity;->getHandler2()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 46
    return-void
.end method

.method public KTinitPurchase(Ljava/lang/String;)V
    .locals 0
    .param p1, "AppID"    # Ljava/lang/String;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/beyond/KTPurchaseActivity;->s_set_AppID:Ljava/lang/String;

    .line 33
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 26
    invoke-super {p0, p1}, Lcom/kt/olleh/inapp/KTInAppActivity;->onCreate(Landroid/os/Bundle;)V

    .line 27
    iget-object v0, p0, Lcom/beyond/KTPurchaseActivity;->mInAPInformationListener:Lcom/kt/olleh/inapp/OnInAppListener;

    invoke-virtual {p0, v0}, Lcom/beyond/KTPurchaseActivity;->init(Lcom/kt/olleh/inapp/OnInAppListener;)V

    .line 28
    return-void
.end method

.method public purchase(Ljava/lang/String;)V
    .locals 1
    .param p1, "itemid"    # Ljava/lang/String;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/beyond/KTPurchaseActivity;->s_set_AppID:Ljava/lang/String;

    invoke-super {p0, v0, p1}, Lcom/kt/olleh/inapp/KTInAppActivity;->purchase(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    return-void
.end method
