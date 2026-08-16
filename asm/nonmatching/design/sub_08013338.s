	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013338
sub_08013338: @ 0x08013338
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _08013350
	ldr r0, _0801334C @ =gUnknown_084893AC
	bl Proc_StartBlocking
	b _08013358
	.align 2, 0
_0801334C: .4byte gUnknown_084893AC
_08013350:
	ldr r0, _08013370 @ =gUnknown_084893AC
	movs r1, #1
	bl Proc_Start
_08013358:
	adds r2, r0, #0
	ldr r1, _08013374 @ =gUnknown_0848950C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0x4c]
	adds r0, r2, #0
	adds r0, #0x44
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013370: .4byte gUnknown_084893AC
_08013374: .4byte gUnknown_0848950C

