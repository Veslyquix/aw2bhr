	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014E44
sub_08014E44: @ 0x08014E44
	push {lr}
	adds r1, r0, #0
	ldr r0, _08014E5C @ =gUnknown_03000050
	ldr r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _08014E60
	adds r0, r2, #0
	bl sub_08014DCC
	b _08014E62
	.align 2, 0
_08014E5C: .4byte gUnknown_03000050
_08014E60:
	movs r0, #0
_08014E62:
	pop {r1}
	bx r1
	.align 2, 0

