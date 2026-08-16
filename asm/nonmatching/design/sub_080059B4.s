	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080059B4
sub_080059B4: @ 0x080059B4
	push {lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #2
	beq _080059D6
	ldr r0, _080059DC @ =gUnknown_0200B0B0
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #2]
	bl sub_0801A614
	bl sub_0801A168
	ldr r0, _080059E0 @ =gUnknown_0848863C
	movs r1, #0
	bl sub_080152C0
_080059D6:
	pop {r0}
	bx r0
	.align 2, 0
_080059DC: .4byte gUnknown_0200B0B0
_080059E0: .4byte gUnknown_0848863C

