	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067D04
sub_08067D04: @ 0x08067D04
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08067D3C @ =gUnknown_085810B8
	bl Proc_Start
	str r5, [r0, #0x34]
	str r6, [r0, #0x38]
	movs r1, #0
	str r1, [r0, #0x3c]
	ldr r0, _08067D40 @ =gUnknown_085810C8
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _08067D44 @ =0x06010000
	bl sub_08011CAC
	ldr r0, _08067D48 @ =gUnknown_0817D9F8
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067D3C: .4byte gUnknown_085810B8
_08067D40: .4byte gUnknown_085810C8
_08067D44: .4byte 0x06010000
_08067D48: .4byte gUnknown_0817D9F8

