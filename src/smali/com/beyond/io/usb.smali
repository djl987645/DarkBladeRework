.class public Lcom/beyond/io/usb;
.super Lcom/beyond/io/comm;
.source "usb.java"

# interfaces
.implements Lorg/kwis/msf/io/Socket;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/beyond/io/comm;-><init>()V

    return-void
.end method


# virtual methods
.method protected getPortID(I)I
    .locals 1
    .param p1, "portID"    # I

    .prologue
    .line 13
    const-string v0, "usb"

    invoke-virtual {p0, v0, p1}, Lcom/beyond/io/usb;->getPortID0(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method
