	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013168
sub_08013168: @ 0x08013168
	push {r4, lr}
	movs r4, #0
	str r4, [r0, #0x54]
	str r4, [r0, #0x58]
	str r4, [r0, #0x5c]
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080131AC
	ldr r3, _0801319C @ =gUnknown_0808E528
	ldr r2, [r3]
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080131A0 @ =gUnknown_03002020
	strh r4, [r0]
	ldr r0, _080131A4 @ =gUnknown_03002B28
	strh r4, [r0]
	ldr r1, _080131A8 @ =gUnknown_03001FFC
	movs r0, #0x10
	strh r0, [r1]
	b _080131C8
	.align 2, 0
_0801319C: .4byte gUnknown_0808E528
_080131A0: .4byte gUnknown_03002020
_080131A4: .4byte gUnknown_03002B28
_080131A8: .4byte gUnknown_03001FFC
_080131AC:
	ldr r3, _080131F4 @ =gUnknown_0808E528
	ldr r2, [r3]
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080131F8 @ =gUnknown_03002020
	strh r4, [r0]
	ldr r0, _080131FC @ =gUnknown_03002B28
	strh r4, [r0]
	ldr r0, _08013200 @ =gUnknown_03001FFC
	strh r4, [r0]
_080131C8:
	ldr r2, [r3]
	ldrh r1, [r2]
	ldr r0, _08013204 @ =0x0000FFE0
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	ldr r1, _08013208 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r2]
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080131F4: .4byte gUnknown_0808E528
_080131F8: .4byte gUnknown_03002020
_080131FC: .4byte gUnknown_03002B28
_08013200: .4byte gUnknown_03001FFC
_08013204: .4byte 0x0000FFE0
_08013208: .4byte 0x0000E0FF

