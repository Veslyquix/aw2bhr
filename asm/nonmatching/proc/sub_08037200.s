	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037200
sub_08037200: @ 0x08037200
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl sub_08037170
	subs r4, #0x18
	ldr r0, _08037244 @ =0x000001FF
	ands r4, r0
	subs r5, #8
	movs r0, #0xff
	ands r5, r0
	ldr r2, _08037248 @ =gUnknown_0848B698
	ldr r0, _0803724C @ =0x00001014
	adds r6, r6, r0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl sub_0801BD00
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037244: .4byte 0x000001FF
_08037248: .4byte gUnknown_0848B698
_0803724C: .4byte 0x00001014

