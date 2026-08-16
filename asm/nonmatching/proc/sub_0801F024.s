	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F024
sub_0801F024: @ 0x0801F024
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _0801F03C @ =gUnknown_03001FE0
	ldr r0, [r0]
	cmp r0, #0
	beq _0801F040
	bl _call_via_r2
	b _0801F04A
	.align 2, 0
_0801F03C: .4byte gUnknown_03001FE0
_0801F040:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	bl sub_0801EDC0
_0801F04A:
	pop {r1}
	bx r1
	.align 2, 0

