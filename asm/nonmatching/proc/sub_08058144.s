	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058144
sub_08058144: @ 0x08058144
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r6, _0805818C @ =gUnknown_084995A0
_0805814C:
	bl sub_08057EC0
	adds r3, r0, #0
	cmp r3, #0
	beq _0805819C
	ldr r0, _08058190 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrb r1, [r3, #1]
	lsls r1, r1, #1
	ldr r7, _08058194 @ =0x0000417A
	adds r0, r2, r7
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r3]
	adds r1, r1, r0
	ldr r0, _08058198 @ =0x0000193A
	adds r2, r2, r0
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	ldr r1, [r6]
	adds r1, r1, r0
	adds r0, r1, #3
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, r5
	bgt _0805814C
	adds r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	b _0805819E
	.align 2, 0
_0805818C: .4byte gUnknown_084995A0
_08058190: .4byte gUnknown_08499590
_08058194: .4byte 0x0000417A
_08058198: .4byte 0x0000193A
_0805819C:
	movs r0, #0
_0805819E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

