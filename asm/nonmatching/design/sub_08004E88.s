	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004E88
sub_08004E88: @ 0x08004E88
	push {r4, r5, lr}
	ldr r4, _08004ED0 @ =gUnknown_0200B0B0
	ldr r0, [r4]
	ldrb r0, [r0, #0x10]
	ldr r5, _08004ED4 @ =gUnknown_0200B204
	adds r1, r5, #0
	bl sub_0803CEB8
	bl sub_0800CAA0
	adds r1, r0, #0
	movs r0, #1
	bl sub_0800CB30
	ldr r0, [r4]
	adds r0, #0x9c
	adds r1, r5, #0
	bl sub_08004E38
	bl sub_080219AC
	bl sub_0800C8D8
	bl sub_0800C874
	ldr r1, [r4]
	strb r0, [r1, #0x12]
	ldr r2, [r4]
	ldrh r1, [r2]
	ldr r0, _08004ED8 @ =0x0000EFFF
	ands r0, r1
	strh r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004ED0: .4byte gUnknown_0200B0B0
_08004ED4: .4byte gUnknown_0200B204
_08004ED8: .4byte 0x0000EFFF

