	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803FFA0
sub_0803FFA0: @ 0x0803FFA0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	adds r0, #3
	cmp r0, #7
	bhi _0803FFDC
	lsls r0, r0, #2
	ldr r1, _0803FFB8 @ =_0803FFBC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FFB8: .4byte _0803FFBC
_0803FFBC: @ jump table
	.4byte _0803FFDC @ case 0
	.4byte _08040018 @ case 1
	.4byte _08040018 @ case 2
	.4byte _0803FFDC @ case 3
	.4byte _0803FFDC @ case 4
	.4byte _0803FFF0 @ case 5
	.4byte _0803FFF0 @ case 6
	.4byte _08040004 @ case 7
_0803FFDC:
	ldr r6, _0803FFE4 @ =gUnknown_0810EB00
	ldr r5, _0803FFE8 @ =gUnknown_0810F364
	ldr r0, _0803FFEC @ =gUnknown_0810F384
	b _0804001E
	.align 2, 0
_0803FFE4: .4byte gUnknown_0810EB00
_0803FFE8: .4byte gUnknown_0810F364
_0803FFEC: .4byte gUnknown_0810F384
_0803FFF0:
	ldr r6, _0803FFF8 @ =gUnknown_0810F410
	ldr r5, _0803FFFC @ =gUnknown_0810FAE8
	ldr r0, _08040000 @ =gUnknown_0810FB08
	b _0804001E
	.align 2, 0
_0803FFF8: .4byte gUnknown_0810F410
_0803FFFC: .4byte gUnknown_0810FAE8
_08040000: .4byte gUnknown_0810FB08
_08040004:
	ldr r6, _0804000C @ =gUnknown_0810FB94
	ldr r5, _08040010 @ =gUnknown_0810FF4C
	ldr r0, _08040014 @ =gUnknown_0810FF6C
	b _0804001E
	.align 2, 0
_0804000C: .4byte gUnknown_0810FB94
_08040010: .4byte gUnknown_0810FF4C
_08040014: .4byte gUnknown_0810FF6C
_08040018:
	ldr r6, _08040048 @ =gUnknown_0810FFE0
	ldr r5, _0804004C @ =gUnknown_08110CBC
	ldr r0, _08040050 @ =gUnknown_08110CDC
_0804001E:
	movs r1, #1
	movs r2, #1
	bl sub_0801C210
	str r0, [r4, #0x50]
	movs r2, #0
	ldr r1, _08040054 @ =0x000051CA
	strh r1, [r0, #0x22]
	ldr r1, [r4, #0x54]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08040058
	adds r0, #1
	cmp r1, r0
	bne _0804006A
	ldr r0, [r4, #0x50]
	strh r2, [r0, #0x18]
	movs r0, #0xf0
	lsls r0, r0, #7
	b _08040060
	.align 2, 0
_08040048: .4byte gUnknown_0810FFE0
_0804004C: .4byte gUnknown_08110CBC
_08040050: .4byte gUnknown_08110CDC
_08040054: .4byte 0x000051CA
_08040058:
	ldr r0, [r4, #0x50]
	strh r2, [r0, #0x18]
	movs r0, #0xc8
	lsls r0, r0, #8
_08040060:
	movs r1, #0x64
	bl Div
	ldr r1, [r4, #0x50]
	strh r0, [r1, #0x1a]
_0804006A:
	ldr r1, _08040084 @ =0x06013940
	adds r0, r6, #0
	bl sub_08011CAC
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r5, #0
	movs r2, #0x20
	bl sub_08013618
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040084: .4byte 0x06013940

