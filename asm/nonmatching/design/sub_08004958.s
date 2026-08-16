	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004958
sub_08004958: @ 0x08004958
	push {lr}
	bl sub_0801A168
	ldr r0, _0800496C @ =gUnknown_0848721C
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0800496C: .4byte gUnknown_0848721C

