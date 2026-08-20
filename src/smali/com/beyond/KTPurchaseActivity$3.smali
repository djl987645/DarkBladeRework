.class Lcom/beyond/KTPurchaseActivity$3;
.super Ljava/lang/Object;
.source "KTPurchaseActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/beyond/KTPurchaseActivity;->showDialog(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/beyond/KTPurchaseActivity;


# direct methods
.method constructor <init>(Lcom/beyond/KTPurchaseActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/beyond/KTPurchaseActivity$3;->this$0:Lcom/beyond/KTPurchaseActivity;

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x4

    const/4 v3, 0x3

    const/4 v2, 0x0

    .line 144
    if-ne p2, v1, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    .line 147
    invoke-static {v3, v2}, Lcom/beyond/CletActivity;->handleSendBuyEvent(II)V

    .line 149
    :cond_0
    if-ne p2, v1, :cond_1

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 152
    invoke-static {v3, v2}, Lcom/beyond/CletActivity;->handleSendBuyEvent(II)V

    .line 157
    :cond_1
    return v2
.end method
