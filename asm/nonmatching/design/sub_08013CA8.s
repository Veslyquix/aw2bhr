	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013CA8
sub_08013CA8: @ 0x08013CA8
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _08013CF0 @ =gUnknown_08499580
	movs r0, #0xd8
	lsls r0, r0, #2
	adds r4, r0, #0
	ldr r3, _08013CF4 @ =0x000003FF
_08013CB6:
	ldr r0, [r5]
	lsls r1, r2, #1
	adds r1, r1, r0
	strh r4, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	bls _08013CB6
	movs r2, #0
	ldr r5, _08013CF8 @ =gUnknown_030030B4
	ldr r4, _08013CFC @ =0x0600D800
	movs r3, #0
_08013CD0:
	ldr r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	lsls r1, r2, #1
	adds r0, r0, r1
	adds r0, r0, r4
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xf
	bls _08013CD0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013CF0: .4byte gUnknown_08499580
_08013CF4: .4byte 0x000003FF
_08013CF8: .4byte gUnknown_030030B4
_08013CFC: .4byte 0x0600D800

