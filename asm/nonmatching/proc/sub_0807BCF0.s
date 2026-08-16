	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BCF0
sub_0807BCF0: @ 0x0807BCF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bne _0807BD00
	ldr r0, _0807BD48 @ =0x000001CF
	bl sub_0803B4DC
_0807BD00:
	adds r0, r4, #0
	bl sub_0807BED8
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	movs r1, #7
	bl __divsi3
	adds r0, #0x12
	ldr r1, [r4, #0x34]
	cmp r1, r0
	blt _0807BD2E
	adds r0, r4, #0
	bl sub_0807BFB8
_0807BD2E:
	ldr r0, [r4, #0x34]
	cmp r0, #0x31
	ble _0807BD42
	ldr r0, _0807BD4C @ =gUnknown_08616548
	adds r1, r4, #0
	bl Proc_Start
	adds r0, r4, #0
	bl Proc_Break
_0807BD42:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD48: .4byte 0x000001CF
_0807BD4C: .4byte gUnknown_08616548

