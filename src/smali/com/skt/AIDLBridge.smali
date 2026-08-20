.class public abstract Lcom/skt/AIDLBridge;
.super Ljava/lang/Object;
.source "AIDLBridge.java"


# static fields
.field static final INIT_SUCCESS:Ljava/lang/String; = "kaf init ok"

.field protected static initError:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/4 v0, 0x1

    sput v0, Lcom/skt/AIDLBridge;->initError:I

    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInitError()I
    .locals 1

    .prologue
    .line 30
    sget v0, Lcom/skt/AIDLBridge;->initError:I

    return v0
.end method
