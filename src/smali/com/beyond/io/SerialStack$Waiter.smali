.class Lcom/beyond/io/SerialStack$Waiter;
.super Ljava/lang/Object;
.source "SerialStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/SerialStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Waiter"
.end annotation


# instance fields
.field aheadok:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 852
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 853
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/SerialStack$Waiter;->aheadok:Z

    .line 852
    return-void
.end method
