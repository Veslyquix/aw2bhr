	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005D14
sub_08005D14: @ 0x08005D14
	push {lr}
	movs r0, #8
	bl sub_0800056C
	ldr r0, _08005D48 @ =gUnknown_0200B0B0
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x46
	movs r0, #0x15
	strh r0, [r2]
	adds r1, #0x48
	movs r0, #0x10
	strh r0, [r1]
	bl sub_0801A614
	bl sub_0801A168
	ldr r0, _08005D4C @ =gUnknown_0848867C
	movs r1, #0
	bl sub_080152EC
	movs r0, #8
	bl sub_0800056C
	pop {r0}
	bx r0
	.align 2, 0
_08005D48: .4byte gUnknown_0200B0B0
_08005D4C: .4byte gUnknown_0848867C

