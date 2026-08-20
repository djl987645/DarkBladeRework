.class Lcom/beyond/KTPurchaseActivity$2;
.super Ljava/lang/Object;
.source "KTPurchaseActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    iput-object p1, p0, Lcom/beyond/KTPurchaseActivity$2;->this$0:Lcom/beyond/KTPurchaseActivity;

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 131
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 132
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/beyond/CletActivity;->handleSendBuyEvent(II)V

    .line 133
    return-void
.end method
