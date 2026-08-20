.class Lcom/kt/olleh/inapp/Purchase$Data;
.super Ljava/lang/Object;
.source "Purchase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/kt/olleh/inapp/Purchase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Data"
.end annotation


# instance fields
.field CardName:Ljava/lang/String;

.field Dialog_BtnCnt:I

.field Dialog_Btn_Text_01:Ljava/lang/String;

.field Dialog_Btn_Text_02:Ljava/lang/String;

.field Dialog_Message:Ljava/lang/String;

.field Dialog_Mode:I

.field Item_Name:Ljava/lang/String;

.field Item_Price:I

.field Pay_Alert_Mode:I

.field Pay_Type:Ljava/lang/String;

.field isPayInformation:Z

.field isPayMessage:Z

.field final synthetic this$0:Lcom/kt/olleh/inapp/Purchase;


# direct methods
.method constructor <init>(Lcom/kt/olleh/inapp/Purchase;)V
    .locals 0

    .prologue
    .line 575
    iput-object p1, p0, Lcom/kt/olleh/inapp/Purchase$Data;->this$0:Lcom/kt/olleh/inapp/Purchase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
