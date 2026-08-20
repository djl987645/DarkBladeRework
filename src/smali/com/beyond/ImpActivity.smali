.class public Lcom/beyond/ImpActivity;
.super Landroid/app/Activity;
.source "ImpActivity.java"


# static fields
.field public static final BUY_ITEM:I = 0x1f6


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public ShowToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 38
    const/4 v1, 0x1

    invoke-static {p1, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 39
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 41
    return-void
.end method

.method public buyItem(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "PID"    # Ljava/lang/String;
    .param p2, "pName"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 30
    invoke-static {v0, v0}, Lcom/beyond/CletActivity;->handleSendBuyEvent(II)V

    .line 31
    return-void
.end method

.method public initPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "AppID"    # Ljava/lang/String;
    .param p2, "PID"    # Ljava/lang/String;
    .param p3, "BP_IP"    # Ljava/lang/String;
    .param p4, "BP_Port"    # I

    .prologue
    .line 20
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 15
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 16
    return-void
.end method

.method public popPurchaseDlg(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "PID"    # Ljava/lang/String;
    .param p2, "pName"    # Ljava/lang/String;

    .prologue
    .line 26
    return-void
.end method
