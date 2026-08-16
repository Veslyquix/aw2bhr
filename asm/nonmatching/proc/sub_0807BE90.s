	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BE90
sub_0807BE90: @ 0x0807BE90
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0807C278
	adds r0, r4, #0
	bl sub_0807C46C
	adds r0, r4, #0
	adds r0, #0x68
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	movs r0, #0xf0
	lsls r0, r0, #0x11
	cmp r1, r0
	beq _0807BEC0
	ldr r0, _0807BED0 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807BEC8
_0807BEC0:
	ldr r0, _0807BED4 @ =gUnknown_08616570
	adds r1, r4, #0
	bl Proc_Start
_0807BEC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BED0: .4byte gUnknown_03002EE0
_0807BED4: .4byte gUnknown_08616570

