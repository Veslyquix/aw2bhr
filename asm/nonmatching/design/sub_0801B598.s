	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B598
sub_0801B598: @ 0x0801B598
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0801B5AC @ =gUnknown_0200CD0C
	ldrb r0, [r0]
	cmp r0, #1
	beq _0801B5B0
	movs r0, #1
	b _0801B5BA
	.align 2, 0
_0801B5AC: .4byte gUnknown_0200CD0C
_0801B5B0:
	adds r0, r2, #0
	bl sub_0808AC44
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0801B5BA:
	pop {r1}
	bx r1
	.align 2, 0

