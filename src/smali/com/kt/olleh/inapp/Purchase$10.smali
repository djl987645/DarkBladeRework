.class Lcom/kt/olleh/inapp/Purchase$10;
.super Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;
.source "Purchase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kt/olleh/inapp/Purchase;->PayDialog(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kt/olleh/inapp/Purchase;

.field private final synthetic val$mode:I


# direct methods
.method constructor <init>(Lcom/kt/olleh/inapp/Purchase;Landroid/app/Dialog;I)V
    .locals 0
    .param p2, "$anonymous0"    # Landroid/app/Dialog;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase$10;->this$0:Lcom/kt/olleh/inapp/Purchase;

    iput p3, p0, Lcom/kt/olleh/inapp/Purchase$10;->val$mode:I

    .line 436
    invoke-direct {p0, p2}, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;-><init>(Landroid/app/Dialog;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 440
    invoke-super {p0, p1}, Lcom/kt/olleh/inapp/dialog/DialogOnClickListener;->onClick(Landroid/view/View;)V

    .line 442
    iget v1, p0, Lcom/kt/olleh/inapp/Purchase$10;->val$mode:I

    packed-switch v1, :pswitch_data_0

    .line 450
    :goto_0
    return-void

    .line 446
    :pswitch_0
    const-string v0, "\uacb0\uc81c\ub97c \ud558\uc9c0 \uc54a\uc73c\uc168\uc2b5\ub2c8\ub2e4."

    .line 447
    .local v0, "msg":Ljava/lang/String;
    iget-object v1, p0, Lcom/kt/olleh/inapp/Purchase$10;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-virtual {v1, v0}, Lcom/kt/olleh/inapp/Purchase;->purchaseErrorDialog(Ljava/lang/String;)V

    goto :goto_0

    .line 442
    nop

    :pswitch_data_0
    .packed-switch 0x3f3
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
