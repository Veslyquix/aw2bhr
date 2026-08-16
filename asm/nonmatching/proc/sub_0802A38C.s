	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A38C
sub_0802A38C: @ 0x0802A38C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _0802A3DC @ =gUnknown_08499590
	ldr r2, [r0]
	ldrb r1, [r4, #3]
	lsls r1, r1, #1
	ldr r5, _0802A3E0 @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r4, #2]
	adds r0, r0, r1
	ldr r1, _0802A3E4 @ =0x0000234A
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0802A3EC
	ldr r5, _0802A3E8 @ =gUnknown_030033EC
	adds r0, r4, #0
	bl _call_via_r3
	adds r2, r0, #0
	cmp r2, #0
	beq _0802A3F2
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x10
	ldrb r1, [r4, #2]
	orrs r1, r0
	str r1, [sp]
	ldrb r1, [r5]
	mov r0, sp
	movs r3, #0
	bl sub_08029CB8
	movs r0, #1
	b _0802A3F4
	.align 2, 0
_0802A3DC: .4byte gUnknown_08499590
_0802A3E0: .4byte 0x0000417A
_0802A3E4: .4byte 0x0000234A
_0802A3E8: .4byte gUnknown_030033EC
_0802A3EC:
	adds r0, r4, #0
	bl _call_via_r3
_0802A3F2:
	movs r0, #0
_0802A3F4:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

