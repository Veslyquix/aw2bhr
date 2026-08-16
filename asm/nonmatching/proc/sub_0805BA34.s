	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805BA34
sub_0805BA34: @ 0x0805BA34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	ldr r0, _0805BAD0 @ =gUnknown_08499590
	ldr r2, [r0]
	lsls r1, r7, #1
	ldr r3, _0805BAD4 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r3, r0, r5
	adds r0, r2, #0
	adds r0, #0x12
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805BAF0
	ldr r0, _0805BAD8 @ =gUnknown_085D5ABC
	ldr r4, _0805BADC @ =0x00000858
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r4, _0805BAE0 @ =0x00001432
	adds r0, r2, r4
	adds r0, r0, r3
	ldrb r2, [r0]
	movs r0, #0x1f
	ands r0, r2
	adds r1, #0x1a
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805BAF0
	ldr r2, _0805BAE4 @ =gUnknown_08499594
	ldr r0, _0805BAE8 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r4, [r2]
	adds r4, r4, r0
	ldr r0, _0805BAEC @ =0x0000270F
	mov r8, r0
	mov r1, r8
	strh r1, [r6]
	subs r0, r5, #1
	ldrb r2, [r4]
	adds r1, r7, #0
	adds r3, r6, #0
	bl sub_0805BAFC
	adds r0, r5, #1
	ldrb r2, [r4]
	adds r1, r7, #0
	adds r3, r6, #0
	bl sub_0805BAFC
	subs r1, r7, #1
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl sub_0805BAFC
	adds r1, r7, #1
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl sub_0805BAFC
	ldrh r0, [r6]
	cmp r0, r8
	beq _0805BAF0
	movs r0, #1
	b _0805BAF2
	.align 2, 0
_0805BAD0: .4byte gUnknown_08499590
_0805BAD4: .4byte 0x0000417A
_0805BAD8: .4byte gUnknown_085D5ABC
_0805BADC: .4byte 0x00000858
_0805BAE0: .4byte 0x00001432
_0805BAE4: .4byte gUnknown_08499594
_0805BAE8: .4byte gUnknown_030040D8
_0805BAEC: .4byte 0x0000270F
_0805BAF0:
	movs r0, #0
_0805BAF2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

